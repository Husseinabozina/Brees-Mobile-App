import '../../domain/entities/bank_account.dart';
import '../../domain/entities/finance_snapshot.dart';
import '../../domain/entities/finance_transaction.dart';
import '../../domain/repositories/finance_repository.dart';

class DemoFinanceRepository implements FinanceRepository {
  @override
  Future<FinanceSnapshot> loadSnapshot() async {
    return const FinanceSnapshot(
      availableBalanceLabel: 'N20,983',
      budgetLabel: 'N29,880',
      accounts: [
        BankAccount(
          name: 'Kuda bank',
          balanceLabel: 'N12,000.00',
          assetPath: 'assets/images/bank_kuda.png',
          accountNumber: '1234567890',
          type: 'Savings',
        ),
        BankAccount(
          name: 'GT Bank',
          balanceLabel: 'N1,050.00',
          assetPath: 'assets/images/bank_gt.png',
        ),
        BankAccount(
          name: 'PiggyVest',
          balanceLabel: 'N6,083.00',
          assetPath: 'assets/images/bank_piggy.png',
        ),
        BankAccount(
          name: 'UBA',
          balanceLabel: 'N950',
          assetPath: 'assets/images/bank_uba.png',
        ),
      ],
      transactions: [
        FinanceTransaction(
          title: 'John Ogaga',
          subtitle: 'Zenith Bank 12:03 AM',
          amountLabel: '+N20,983',
          initial: 'J',
          isIncome: true,
        ),
        FinanceTransaction(
          title: 'The Place Restaurant',
          subtitle: 'GT-Bank 12:03 AM',
          amountLabel: '-N983',
          initial: 'T',
          isIncome: false,
        ),
        FinanceTransaction(
          title: 'Transfer to Philip',
          subtitle: 'GT-Bank 12:03 AM',
          amountLabel: '-N298',
          initial: 'P',
          isIncome: false,
        ),
        FinanceTransaction(
          title: 'Habib Yogurt',
          subtitle: 'GT-Bank 12:03 AM',
          amountLabel: '-N4,115',
          initial: 'H',
          isIncome: false,
        ),
      ],
    );
  }
}
