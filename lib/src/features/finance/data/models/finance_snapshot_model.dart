import '../../domain/entities/bank_account.dart';
import '../../domain/entities/finance_snapshot.dart';
import '../../domain/entities/finance_transaction.dart';

class FinanceSnapshotModel {
  const FinanceSnapshotModel({
    required this.availableBalanceLabel,
    required this.budgetLabel,
    required this.accounts,
    required this.transactions,
  });

  factory FinanceSnapshotModel.fromJson(Map<String, dynamic> json) {
    final rawAccounts = json['accounts'];
    final rawTransactions = json['transactions'];

    if (rawAccounts is! List || rawTransactions is! List) {
      throw const FormatException('Invalid finance snapshot payload.');
    }

    return FinanceSnapshotModel(
      availableBalanceLabel: json['availableBalanceLabel'] as String? ?? '',
      budgetLabel: json['budgetLabel'] as String? ?? '',
      accounts: rawAccounts
          .map(
            (item) => BankAccountModel.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList(growable: false),
      transactions: rawTransactions
          .map(
            (item) => FinanceTransactionModel.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList(growable: false),
    );
  }

  final String availableBalanceLabel;
  final String budgetLabel;
  final List<BankAccountModel> accounts;
  final List<FinanceTransactionModel> transactions;

  FinanceSnapshot toDomain() {
    return FinanceSnapshot(
      availableBalanceLabel: availableBalanceLabel,
      budgetLabel: budgetLabel,
      accounts: accounts.map((account) => account.toDomain()).toList(
            growable: false,
          ),
      transactions: transactions
          .map((transaction) => transaction.toDomain())
          .toList(growable: false),
    );
  }
}

class BankAccountModel {
  const BankAccountModel({
    required this.name,
    required this.balanceLabel,
    required this.assetPath,
    this.accountNumber,
    this.type,
  });

  factory BankAccountModel.fromJson(Map<String, dynamic> json) {
    return BankAccountModel(
      name: json['name'] as String? ?? '',
      balanceLabel: json['balanceLabel'] as String? ?? '',
      assetPath: json['assetPath'] as String? ?? '',
      accountNumber: json['accountNumber'] as String?,
      type: json['type'] as String?,
    );
  }

  final String name;
  final String balanceLabel;
  final String assetPath;
  final String? accountNumber;
  final String? type;

  BankAccount toDomain() {
    return BankAccount(
      name: name,
      balanceLabel: balanceLabel,
      assetPath: assetPath,
      accountNumber: accountNumber,
      type: type,
    );
  }
}

class FinanceTransactionModel {
  const FinanceTransactionModel({
    required this.title,
    required this.subtitle,
    required this.amountLabel,
    required this.initial,
    required this.isIncome,
  });

  factory FinanceTransactionModel.fromJson(Map<String, dynamic> json) {
    return FinanceTransactionModel(
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      amountLabel: json['amountLabel'] as String? ?? '',
      initial: json['initial'] as String? ?? '',
      isIncome: json['isIncome'] as bool? ?? false,
    );
  }

  final String title;
  final String subtitle;
  final String amountLabel;
  final String initial;
  final bool isIncome;

  FinanceTransaction toDomain() {
    return FinanceTransaction(
      title: title,
      subtitle: subtitle,
      amountLabel: amountLabel,
      initial: initial,
      isIncome: isIncome,
    );
  }
}
