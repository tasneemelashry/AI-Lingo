import 'dart:async';
import 'package:ai_lingo/features/auth/cubit/auth_state.dart';
import 'package:ai_lingo/features/auth/models/auth_user.dart';
import 'package:ai_lingo/features/auth/data/auth_failure.dart';
import 'package:ai_lingo/features/auth/data/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(AuthRepository repository)
    : repository = repository,
      super(initialState(repository)) {
    subscription = this.repository.authStateChanges.listen(onAuthChanged);
  }

  final AuthRepository repository;
  late final StreamSubscription<AuthUser?> subscription;

  AuthUser? get currentUser => repository.currentUser;

  static AuthState initialState(AuthRepository repository) {
    final user = repository.currentUser;
    return user == null ? const Unauthenticated() : Authenticated(user);
  }

  void onAuthChanged(AuthUser? user) {
    if (state is AuthLoading || state is ResetLinkSent) return;
    emit(user == null ? const Unauthenticated() : Authenticated(user));
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) => run(() async {
    final user = await repository.signUp(
      name: name,
      email: email,
      password: password,
    );
    emit(Authenticated(user));
  });

  Future<void> signIn({required String email, required String password}) =>
      run(() async {
        final user = await repository.signIn(email: email, password: password);
        emit(Authenticated(user));
      });

  Future<void> forgotPassword(String email) => run(() async {
    try {
      await repository.sendPasswordReset(email);
    } on AuthException catch (e) {
      if (e.failure == AuthFailure.network ||
          e.failure == AuthFailure.tooManyRequests) {
        rethrow;
      }
    }
    emit(ResetLinkSent(email.trim()));
  });

  Future<void> sendEmailVerification() => run(() async {
    await repository.sendEmailVerification();
    final user = repository.currentUser;
    emit(user == null ? const Unauthenticated() : Authenticated(user));
  });

  Future<bool> checkEmailVerified() async {
    emit(const AuthLoading());
    try {
      final user = await repository.reloadUser();
      if (user == null) {
        emit(const Unauthenticated());
        return false;
      }
      emit(Authenticated(user));
      return user.emailVerified;
    } on AuthException catch (e) {
      emit(AuthError(e.failure));
    } catch (_) {
      emit(const AuthError(AuthFailure.unknown));
    }
    return false;
  }

  Future<void> signOut() => run(() async {
    await repository.signOut();
    emit(const Unauthenticated());
  });

  Future<void> run(Future<void> Function() action) async {
    emit(const AuthLoading());
    try {
      await action();
    } on AuthException catch (e) {
      emit(AuthError(e.failure));
    } catch (_) {
      emit(const AuthError(AuthFailure.unknown));
    }
  }

  @override
  Future<void> close() async {
    await subscription.cancel();
    await super.close();
  }
}
