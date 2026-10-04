class BankAccount {
  const BankAccount({
    required this.name,
    required this.balanceLabel,
    required this.assetPath,
    this.accountNumber,
    this.type,
  });

  final String name;
  final String balanceLabel;
  final String assetPath;
  final String? accountNumber;
  final String? type;
}
