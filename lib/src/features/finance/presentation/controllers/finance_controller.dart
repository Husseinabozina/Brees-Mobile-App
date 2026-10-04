import 'package:flutter/foundation.dart';

import '../../domain/entities/finance_snapshot.dart';
import '../../domain/usecases/load_finance_snapshot.dart';

class FinanceController extends ChangeNotifier {
  FinanceController(this._loadFinanceSnapshot);

  final LoadFinanceSnapshot _loadFinanceSnapshot;

  FinanceSnapshot? snapshot;
  bool loading = false;

  Future<void> ensureLoaded() async {
    if (snapshot != null || loading) return;
    loading = true;
    notifyListeners();
    snapshot = await _loadFinanceSnapshot();
    loading = false;
    notifyListeners();
  }
}
