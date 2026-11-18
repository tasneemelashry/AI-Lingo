abstract final class Routes {
  static const String splash = '/splash';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String signUp = '/sign-up';
  static const String forgotPassword = '/forgot-password';
  static const String checkEmail = '/check-email';
  static const String setup = '/setup';
  static const String home = '/home';
  static const Set<String> protected = {setup, home};
}
