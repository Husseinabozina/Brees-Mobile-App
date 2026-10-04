import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_exception.dart';
import '../models/finance_snapshot_model.dart';

abstract interface class FinanceRemoteDataSource {
  Future<FinanceSnapshotModel> loadSnapshot();
}

class FinanceRemoteDataSourceImpl implements FinanceRemoteDataSource {
  const FinanceRemoteDataSourceImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<FinanceSnapshotModel> loadSnapshot() async {
    final response = await _apiClient.get('/v1/finance/snapshot');
    final data = response['data'];

    if (data is! Map) {
      throw const ApiException(
        statusCode: 500,
        message: 'Finance payload is missing data.',
      );
    }

    return FinanceSnapshotModel.fromJson(
      Map<String, dynamic>.from(data),
    );
  }
}
