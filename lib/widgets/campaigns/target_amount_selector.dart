import 'package:flutter/material.dart';

class TargetAmountSelector extends StatelessWidget {
  final int amount;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const TargetAmountSelector({
    super.key,
    required this.amount,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          'Target Amount',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0E0E18),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white12,
              width: 0.8,
            ),
          ),
          child: Row(
            children: [

              // ── Minus ──
              _AmountButton(
                icon: Icons.remove,
                onTap: onDecrement,
              ),

              // ── Amount ──
              Expanded(
                child: Text(
                  '$amount',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              // ── Plus ──
              _AmountButton(
                icon: Icons.add,
                onTap: onIncrement,
              ),

            ],
          ),
        ),

      ],
    );
  }
}

class _AmountButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _AmountButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52,
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A2A),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white12,
            width: 0.8,
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white70,
          size: 20,
        ),
      ),
    );
  }
}