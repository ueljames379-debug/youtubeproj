import 'package:flutter/material.dart';
import 'quick_action_card.dart';

class QuickActions extends StatelessWidget {
  final VoidCallback onCreate;
  final VoidCallback onTasks;
  final VoidCallback onRefer;
  final VoidCallback onBuyCoins;

  const QuickActions({
    super.key,
    required this.onCreate,
    required this.onTasks,
    required this.onRefer,
    required this.onBuyCoins,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Expanded(
          child: QuickActionCard(
            icon: Icons.add_circle_outline,
            title: 'Create',
            onTap: onCreate,
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: QuickActionCard(
            icon: Icons.check_circle_outline,
            title: 'Tasks',
            onTap: onTasks,
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: QuickActionCard(
            icon: Icons.people_outline,
            title: 'Refer',
            onTap: onRefer,
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: QuickActionCard(
            icon: Icons.monetization_on_outlined,
            title: 'Buy Coins',
            onTap: onBuyCoins,
          ),
        ),

      ],
    );
  }
}