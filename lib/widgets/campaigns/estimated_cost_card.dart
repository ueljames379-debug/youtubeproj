import 'package:flutter/material.dart';

class EstimatedCostCard extends StatelessWidget {
  final int estimatedCost;
  final int coinsPerUnit;

  const EstimatedCostCard({
    super.key,
    required this.estimatedCost,
    required this.coinsPerUnit,
  });

  String _formatCost(int cost) {
    return cost.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]},',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF12121A),
            Color(0xFF1C1030),
          ],
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white12,
          width: 0.8,
        ),
      ),
      child: Column(
        children: [

          // ── Label ──
          const Text(
            'TOTAL ESTIMATED COST',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.3,
            ),
          ),

          const SizedBox(height: 12),

          // ── Amount ──
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.monetization_on_outlined,
                color: Color(0xFFE57373),
                size: 28,
              ),
              const SizedBox(width: 6),
              Text(
                _formatCost(estimatedCost),
                style: const TextStyle(
                  color: Color(0xFFE57373),
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  height: 1.0,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // ── Subtitle ──
          Text(
            'Calculated at $coinsPerUnit coins per unit',
            style: const TextStyle(
              color: Colors.white38,
              fontSize: 12,
            ),
          ),

        ],
      ),
    );
  }
}