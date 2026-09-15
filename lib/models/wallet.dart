import 'wallet_transaction.dart';

class Wallet {
  final int balance;
  final List<WalletTransaction> transactions;

  const Wallet({
    required this.balance,
    required this.transactions,
  });
}

const mockWallet = Wallet(
  balance: 2450,
  transactions: mockTransactions,
);