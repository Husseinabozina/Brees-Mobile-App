class RegistrationDraft {
  const RegistrationDraft({
    required this.name,
    required this.email,
    required this.password,
    required this.acceptedTerms,
  });

  final String name;
  final String email;
  final String password;
  final bool acceptedTerms;

  bool get isValid =>
      name.trim().isNotEmpty &&
      email.contains('@') &&
      password.length >= 8 &&
      acceptedTerms;
}
