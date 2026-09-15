import 'package:flutter/material.dart';

class VipStatusCard extends StatelessWidget {
  final VoidCallback onUpgrade;

  const VipStatusCard({super.key, required this.onUpgrade});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1A1230), Color(0xFF120D24)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFF7C4DFF).withOpacity(0.35),
          width: 1,
        ),
      ),
      child: Row(
        children: [

          // ── Icon ──
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF7C4DFF).withOpacity(0.2),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF7C4DFF).withOpacity(0.4),
                width: 1,
              ),
            ),
            child: const Icon(
              Icons.emoji_events_outlined,
              color: Color(0xFF9C6FFF),
              size: 20,
            ),
          ),

          const SizedBox(width: 12),

          // ── Text ──
          const Expanded(
            child: Text(
              'Get VIP Status',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // ── Upgrade Button ──
          GestureDetector(
            onTap: onUpgrade,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF7C4DFF).withOpacity(0.25),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFF7C4DFF).withOpacity(0.5),
                  width: 1,
                ),
              ),
              child: const Text(
                'Upgrade',
                style: TextStyle(
                  color: Color(0xFFB39DDB),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}