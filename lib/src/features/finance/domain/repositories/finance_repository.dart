import '../entities/finance_snapshot.dart';

abstract interface class FinanceRepository {
  Future<FinanceSnapshot> loadSnapshot();
}
