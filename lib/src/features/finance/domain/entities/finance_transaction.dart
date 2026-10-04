class FinanceTransaction {
  const FinanceTransaction({
    required this.title,
    required this.subtitle,
    required this.amountLabel,
    required this.initial,
    required this.isIncome,
  });

  final String title;
  final String subtitle;
  final String amountLabel;
  final String initial;
  final bool isIncome;
}
