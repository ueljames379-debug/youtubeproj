enum TransactionType { task, campaign, referral }

class WalletTransaction {
  final TransactionType type;
  final String title;
  final String date;
  final int amount;

  const WalletTransaction({
    required this.type,
    required this.title,
    required this.date,
    required this.amount,
  });
}

const List<WalletTransaction> mockTransactions = [
  WalletTransaction(
    type: TransactionType.task,
    title: 'Task: YouTube Subscribe',
    date: 'Today, 10:42 AM',
    amount: 45,
  ),
  WalletTransaction(
    type: TransactionType.campaign,
    title: 'Campaign: Instagram Followers',
    date: 'Yesterday, 2:15 PM',
    amount: -300,
  ),
  WalletTransaction(
    type: TransactionType.referral,
    title: 'Referral Bonus',
    date: 'Nov 12, 2023',
    amount: 100,
  ),
];