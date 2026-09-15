import 'package:flutter/material.dart';

class EarnMoreActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String reward;
  final Color rewardColor;
  final Color iconBgColor;
  final Color iconColor;
  final VoidCallback onTap;

  const EarnMoreActionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.reward,
    required this.rewardColor,
    required this.iconBgColor,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [

            // ── Icon container ──
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: iconColor.withOpacity(0.25),
                  width: 0.8,
                ),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 18,
              ),
            ),

            const SizedBox(width: 12),

            // ── Title + Reward ──
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    reward,
                    style: TextStyle(
                      color: rewardColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // ── Chevron ──
            const Icon(
              Icons.chevron_right,
              color: Colors.white38,
              size: 20,
            ),

          ],
        ),
      ),
    );
  }
}