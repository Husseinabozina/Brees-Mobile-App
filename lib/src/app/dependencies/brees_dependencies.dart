import '../../core/network/api_client.dart';
import '../../core/network/mock_api_client.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/finance/data/datasources/finance_remote_data_source.dart';
import '../../features/finance/data/repositories/finance_repository_impl.dart';
import '../../features/finance/domain/repositories/finance_repository.dart';

class BreesDependencies {
  const BreesDependencies({
    required this.authRepository,
    required this.financeRepository,
  });

  factory BreesDependencies.fromApiClient(ApiClient apiClient) {
    return BreesDependencies(
      authRepository: AuthRepositoryImpl(
        AuthRemoteDataSourceImpl(apiClient),
      ),
      financeRepository: FinanceRepositoryImpl(
        FinanceRemoteDataSourceImpl(apiClient),
      ),
    );
  }

  factory BreesDependencies.mock({
    Duration latency = const Duration(milliseconds: 120),
  }) {
    return BreesDependencies.fromApiClient(
      MockApiClient(latency: latency),
    );
  }

  final AuthRepository authRepository;
  final FinanceRepository financeRepository;
}
