import '../../domain/entities/registration_draft.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/registration_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;

  @override
  Future<void> register(RegistrationDraft draft) {
    return _remoteDataSource.register(
      RegistrationRequestModel.fromDomain(draft),
    );
  }
}
