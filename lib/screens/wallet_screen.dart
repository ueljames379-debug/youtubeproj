import 'package:flutter/material.dart';
import '../models/wallet.dart';
import '../widgets/wallet/wallet_header.dart';
import '../widgets/wallet/balance_card.dart';
import '../widgets/wallet/recent_transactions_card.dart';
import '../widgets/wallet/earn_more_card.dart';

class WalletScreen extends StatelessWidget {
  final Wallet wallet;

  const WalletScreen({
    super.key,
    required this.wallet,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 20),

              // ── Wallet Header ──
              const WalletHeader(),

              const SizedBox(height: 20),

              // ── Balance Card ──
              BalanceCard(
                balance: wallet.balance,
                onAddCoins: () {
                  // TODO: Navigate to add coins flow
                },
                onSpendOnCampaigns: () {
                  // TODO: Navigate to campaigns
                },
              ),

              const SizedBox(height: 16),

              // ── Recent Transactions ──
              RecentTransactionsCard(
                transactions: wallet.transactions,
                onViewAll: () {
                  // TODO: Navigate to all transactions
                },
                onTransactionTap: (transaction) {
                  // TODO: Navigate to transaction detail
                },
              ),

              const SizedBox(height: 16),

              // ── Earn More ──
              EarnMoreCard(
                onWatchRewardAd: () {
                  // TODO: Show reward ad
                },
                onDailyStreak: () {
                  // TODO: Open daily streak
                },
              ),

              const SizedBox(height: 24),

            ],
          ),
        ),
      ),
    );
  }
}