import '../entities/registration_draft.dart';
import '../repositories/auth_repository.dart';

class RegisterUser {
  const RegisterUser(this._repository);

  final AuthRepository _repository;

  Future<void> call(RegistrationDraft draft) async {
    if (!draft.isValid) {
      throw const FormatException('Complete the form and accept the terms.');
    }
    await _repository.register(draft);
  }
}
