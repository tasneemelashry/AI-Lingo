enum AuthFailure {
  invalidCredentials('Email or password is incorrect.'),
  emailInUse('This email already has an account. Try signing in.'),
  weakPassword('Use at least 8 characters with letters and numbers.'),
  invalidEmail('Enter a valid email.'),
  userDisabled('This account has been disabled.'),
  tooManyRequests('Too many attempts. Try again in a few minutes.'),
  network("You're offline. Connect to continue."),
  unknown('Something went wrong. Please try again.');

  const AuthFailure(this.message);

  final String message;
}

class AuthException implements Exception {
  const AuthException(this.failure);

  final AuthFailure failure;

  @override
  String toString() => 'AuthException($failure)';
}
