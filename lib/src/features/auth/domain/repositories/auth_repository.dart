import '../entities/registration_draft.dart';

abstract interface class AuthRepository {
  Future<void> register(RegistrationDraft draft);
}
