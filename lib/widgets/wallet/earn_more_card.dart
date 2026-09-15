import 'package:flutter/material.dart';
import 'earn_more_action_tile.dart';

class EarnMoreCard extends StatelessWidget {
  final VoidCallback onWatchRewardAd;
  final VoidCallback onDailyStreak;

  const EarnMoreCard({
    super.key,
    required this.onWatchRewardAd,
    required this.onDailyStreak,
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
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Row(
              children: const [
                Text(
                  '🔥',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 8),
                Text(
                  'Earn More',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          // ── Subtitle ──
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 4, 16, 14),
            child: Text(
              'Boost your balance quickly.',
              style: TextStyle(
                color: Colors.white38,
                fontSize: 13,
              ),
            ),
          ),

          // ── Divider ──
          const Divider(
            color: Colors.white12,
            height: 1,
            thickness: 0.8,
          ),

          // ── Watch Reward Ad ──
          EarnMoreActionTile(
            icon: Icons.play_circle_outline,
            title: 'Watch Reward Ad',
            reward: '+20 Coins',
            rewardColor: const Color(0xFF9C6FFF),
            iconBgColor: const Color(0xFF1C1535),
            iconColor: const Color(0xFF9C6FFF),
            onTap: onWatchRewardAd,
          ),

          // ── Divider ──
          const Divider(
            color: Colors.white12,
            height: 1,
            thickness: 0.8,
            indent: 16,
            endIndent: 16,
          ),

          // ── Daily Streak ──
          EarnMoreActionTile(
            icon: Icons.calendar_today_outlined,
            title: 'Daily Streak',
            reward: '+50 Coins',
            rewardColor: const Color(0xFFE57373),
            iconBgColor: const Color(0xFF2A1515),
            iconColor: const Color(0xFFE57373),
            onTap: onDailyStreak,
          ),

          const SizedBox(height: 4),

        ],
      ),
    );
  }
}