class AuthUser {
  const AuthUser({
    required this.uid,
    this.email,
    this.name,
    this.emailVerified = false,
  });

  final String uid;
  final String? email;
  final String? name;
  final bool emailVerified;
}
