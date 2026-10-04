import '../../../../core/network/api_client.dart';
import '../models/registration_request_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<void> register(RegistrationRequestModel request);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<void> register(RegistrationRequestModel request) async {
    await _apiClient.post(
      '/v1/auth/register',
      body: request.toJson(),
    );
  }
}
