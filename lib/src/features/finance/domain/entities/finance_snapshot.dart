import 'bank_account.dart';
import 'finance_transaction.dart';

class FinanceSnapshot {
  const FinanceSnapshot({
    required this.availableBalanceLabel,
    required this.budgetLabel,
    required this.accounts,
    required this.transactions,
  });

  final String availableBalanceLabel;
  final String budgetLabel;
  final List<BankAccount> accounts;
  final List<FinanceTransaction> transactions;
}
