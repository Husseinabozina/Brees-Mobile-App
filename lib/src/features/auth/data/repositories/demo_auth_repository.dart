import '../../domain/entities/registration_draft.dart';
import '../../domain/repositories/auth_repository.dart';

class DemoAuthRepository implements AuthRepository {
  @override
  Future<void> register(RegistrationDraft draft) async {
    await Future<void>.delayed(const Duration(milliseconds: 450));
  }
}
