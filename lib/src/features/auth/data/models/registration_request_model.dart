import '../../domain/entities/registration_draft.dart';

class RegistrationRequestModel {
  const RegistrationRequestModel({
    required this.name,
    required this.email,
    required this.password,
  });

  factory RegistrationRequestModel.fromDomain(RegistrationDraft draft) {
    return RegistrationRequestModel(
      name: draft.name.trim(),
      email: draft.email.trim(),
      password: draft.password,
    );
  }

  final String name;
  final String email;
  final String password;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'email': email,
        'password': password,
      };
}
