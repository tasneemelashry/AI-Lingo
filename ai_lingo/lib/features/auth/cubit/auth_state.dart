import 'package:ai_lingo/features/auth/data/auth_failure.dart';
import 'package:ai_lingo/features/auth/models/auth_user.dart';

abstract class AuthState {
  const AuthState();
}

class Unauthenticated extends AuthState {
  const Unauthenticated();
}

class Authenticated extends AuthState {
  const Authenticated(this.user);

  final AuthUser user;
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthError extends AuthState {
  const AuthError(this.failure);

  final AuthFailure failure;
}

class ResetLinkSent extends AuthState {
  const ResetLinkSent(this.email);

  final String email;
}
