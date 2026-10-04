import '../entities/finance_snapshot.dart';
import '../repositories/finance_repository.dart';

class LoadFinanceSnapshot {
  const LoadFinanceSnapshot(this._repository);

  final FinanceRepository _repository;

  Future<FinanceSnapshot> call() => _repository.loadSnapshot();
}
