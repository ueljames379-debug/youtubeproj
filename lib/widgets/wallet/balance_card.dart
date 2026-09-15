import 'package:flutter/material.dart';
import 'balance_action_button.dart';

class BalanceCard extends StatelessWidget {
  final int balance;
  final VoidCallback onAddCoins;
  final VoidCallback onSpendOnCampaigns;

  const BalanceCard({
    super.key,
    required this.balance,
    required this.onAddCoins,
    required this.onSpendOnCampaigns,
  });

  String _formatBalance(int value) {
    return value.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]},',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF12121A),
            Color(0xFF1C1535),
          ],
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white12,
          width: 0.8,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ── CURRENT BALANCE label ──
          Row(
            children: const [
              Icon(
                Icons.credit_card_outlined,
                color: Colors.white38,
                size: 14,
              ),
              SizedBox(width: 6),
              Text(
                'CURRENT BALANCE',
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.3,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ── Balance amount ──
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                _formatBalance(balance),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  height: 1.0,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Coins',
                style: TextStyle(
                  color: Color(0xFF9C6FFF),
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // ── Add Coins Button ──
          BalanceActionButton(
            icon: Icons.add_circle_outline,
            label: 'Add Coins',
            onTap: onAddCoins,
          ),

          const SizedBox(height: 10),

          // ── Spend on Campaigns Button ──
          BalanceActionButton(
            icon: Icons.rocket_launch_outlined,
            label: 'Spend on Campaigns',
            onTap: onSpendOnCampaigns,
          ),

        ],
      ),
    );
  }
}