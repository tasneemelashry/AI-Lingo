abstract final class Validators {
  static final RegExp email = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  static final RegExp letter = RegExp(r'[A-Za-z]');
  static final RegExp digit = RegExp(r'\d');

  static String? name(String? value) =>
      (value ?? '').trim().isEmpty ? 'Enter your first name' : null;

  static String? emailValidation(String? value) =>
      email.hasMatch((value ?? '').trim()) ? null : 'Enter a valid email';

  static String? newPassword(String? value) {
    final v = value ?? '';
    if (v.length < 8) return 'Use at least 8 characters';
    if (!letter.hasMatch(v) || !digit.hasMatch(v)) {
      return 'Use letters and numbers';
    }
    return null;
  }

  static String? existingPassword(String? value) =>
      (value ?? '').isEmpty ? 'Enter your password' : null;
}
