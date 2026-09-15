import 'package:flutter/material.dart';
import '../../models/wallet_transaction.dart';
import 'transaction_tile.dart';

class RecentTransactionsCard extends StatelessWidget {
  final List<WalletTransaction> transactions;
  final VoidCallback onViewAll;
  final ValueChanged<WalletTransaction> onTransactionTap;

  const RecentTransactionsCard({
    super.key,
    required this.transactions,
    required this.onViewAll,
    required this.onTransactionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF12121A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white12,
          width: 0.8,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ── Header ──
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Text(
                  'Recent Transactions',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                GestureDetector(
                  onTap: onViewAll,
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      color: Color(0xFF9C6FFF),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

              ],
            ),
          ),

          // ── Divider ──
          const Divider(
            color: Colors.white12,
            height: 1,
            thickness: 0.8,
          ),

          // ── Transaction List ──
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactions.length,
            separatorBuilder: (_, __) => const Divider(
              color: Colors.white12,
              height: 1,
              thickness: 0.8,
              indent: 16,
              endIndent: 16,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => onTransactionTap(transactions[index]),
                child: TransactionTile(
                  transaction: transactions[index],
                ),
              );
            },
          ),

          const SizedBox(height: 4),

        ],
      ),
    );
  }
}