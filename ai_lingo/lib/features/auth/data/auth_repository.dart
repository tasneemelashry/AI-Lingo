import 'package:ai_lingo/features/auth/data/auth_failure.dart';
import 'package:ai_lingo/features/auth/models/auth_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  AuthRepository([FirebaseAuth? auth]) : auth = auth ?? FirebaseAuth.instance;

  final FirebaseAuth auth;

  AuthUser? toUser(User? user) => user == null
      ? null
      : AuthUser(
          uid: user.uid,
          email: user.email,
          name: user.displayName,
          emailVerified: user.emailVerified,
        );

  Stream<AuthUser?> get authStateChanges => auth.authStateChanges().map(toUser);

  AuthUser? get currentUser => toUser(auth.currentUser);

  Future<AuthUser> signUp({
    required String name,
    required String email,
    required String password,
  }) => guard(() async {
    final credential = await auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
    await credential.user!.updateDisplayName(name.trim());
    await credential.user!.reload();
    try {
      await credential.user!.sendEmailVerification();
    } on FirebaseAuthException {
    }
    return toUser(auth.currentUser)!;
  });

  Future<AuthUser> signIn({required String email, required String password}) =>
      guard(() async {
        final credential = await auth.signInWithEmailAndPassword(
          email: email.trim(),
          password: password,
        );
        return toUser(credential.user)!;
      });

  Future<void> sendEmailVerification() => guard(() async {
    final user = auth.currentUser;
    if (user == null) throw const AuthException(AuthFailure.unknown);
    await user.sendEmailVerification();
  });

  Future<AuthUser?> reloadUser() => guard(() async {
    await auth.currentUser?.reload();
    return toUser(auth.currentUser);
  });

  Future<void> sendPasswordReset(String email) =>
      guard(() => auth.sendPasswordResetEmail(email: email.trim()));

  Future<void> signOut() => auth.signOut();

  Future<T> guard<T>(Future<T> Function() run) async {
    try {
      return await run();
    } on FirebaseAuthException catch (e) {
      throw AuthException(failureFor(e.code));
    }
  }

  AuthFailure failureFor(String code) => switch (code) {
    'invalid-credential' ||
    'wrong-password' ||
    'user-not-found' => AuthFailure.invalidCredentials,
    'email-already-in-use' => AuthFailure.emailInUse,
    'weak-password' => AuthFailure.weakPassword,
    'invalid-email' => AuthFailure.invalidEmail,
    'user-disabled' => AuthFailure.userDisabled,
    'too-many-requests' => AuthFailure.tooManyRequests,
    'network-request-failed' => AuthFailure.network,
    _ => AuthFailure.unknown,
  };
}
