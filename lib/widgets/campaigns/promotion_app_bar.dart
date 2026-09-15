import 'package:flutter/material.dart';

class PromotionAppBar extends StatelessWidget {
  final VoidCallback onBack;

  const PromotionAppBar({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFF0A0A0F),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.08),
            width: 0.8,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [

          // ── Back Button ──
          GestureDetector(
            onTap: onBack,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white70,
              size: 22,
            ),
          ),

          const SizedBox(width: 14),

          // ── Title ──
          const Text(
            'New Promotion',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),

        ],
      ),
    );
  }
}