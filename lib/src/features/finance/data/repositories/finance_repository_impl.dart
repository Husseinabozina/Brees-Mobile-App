import '../../domain/entities/finance_snapshot.dart';
import '../../domain/repositories/finance_repository.dart';
import '../datasources/finance_remote_data_source.dart';

class FinanceRepositoryImpl implements FinanceRepository {
  const FinanceRepositoryImpl(this._remoteDataSource);

  final FinanceRemoteDataSource _remoteDataSource;

  @override
  Future<FinanceSnapshot> loadSnapshot() async {
    final model = await _remoteDataSource.loadSnapshot();
    return model.toDomain();
  }
}
