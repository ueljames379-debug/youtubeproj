import 'package:flutter/material.dart';
import '../../models/wallet_transaction.dart';

class TransactionTile extends StatelessWidget {
  final WalletTransaction transaction;

  const TransactionTile({
    super.key,
    required this.transaction,
  });

  IconData get _icon {
    switch (transaction.type) {
      case TransactionType.task:
        return Icons.play_circle_outline;
      case TransactionType.campaign:
        return Icons.campaign_outlined;
      case TransactionType.referral:
        return Icons.group_outlined;
    }
  }

  Color get _iconBgColor {
    switch (transaction.type) {
      case TransactionType.task:
        return const Color(0xFF1A1A2E);
      case TransactionType.campaign:
        return const Color(0xFF1A1A2E);
      case TransactionType.referral:
        return const Color(0xFF1A1A2E);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPositive = transaction.amount >= 0;
    final amountText = isPositive
        ? '+${transaction.amount}'
        : '${transaction.amount}';
    final amountColor = isPositive
        ? const Color(0xFF9C6FFF)
        : Colors.white38;
    final amountSize = transaction.amount.abs() >= 100 ? 20.0 : 18.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [

          // ── Icon container ──
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _iconBgColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white10,
                width: 0.8,
              ),
            ),
            child: Icon(
              _icon,
              color: Colors.white54,
              size: 18,
            ),
          ),

          const SizedBox(width: 12),

          // ── Title + Date ──
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  transaction.date,
                  style: const TextStyle(
                    color: Colors.white38,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          // ── Amount ──
          Text(
            amountText,
            style: TextStyle(
              color: amountColor,
              fontSize: amountSize,
              fontWeight: FontWeight.w800,
            ),
          ),

        ],
      ),
    );
  }
}