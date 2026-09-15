import 'package:flutter/material.dart';
import '../../models/user_profile.dart';

class ProfileSummaryCard extends StatelessWidget {
  final UserProfile user;

  const ProfileSummaryCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF12121A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white12, width: 0.8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Column(
          children: [

            // ── Header image with avatar and VIP badge ──
            SizedBox(
              height: 110,
              child: Stack(
                fit: StackFit.expand,
                children: [

                  // Background image
                  Image.network(
                    user.headerImageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xFF1A1A2E),
                    ),
                  ),

                  // Dark overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),

                  // Avatar bottom-left
                  Positioned(
                    bottom: 12,
                    left: 16,
                    child: _ProfileAvatar(avatarUrl: user.avatarUrl),
                  ),

                  // VIP badge top-right
                  Positioned(
                    top: 14,
                    right: 14,
                    child: _VipBadge(tier: user.vipTier),
                  ),

                  // Name + username over image bottom
                  Positioned(
                    bottom: 14,
                    left: 88,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          user.username,
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),

            // ── Stats Row ──
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
              child: Row(
                children: [
                  _StatItem(
                    value: '${user.tasks}',
                    label: 'TASKS',
                  ),
                  const SizedBox(width: 24),
                  _StatItem(
                    value: _formatCoins(user.coins),
                    label: 'COINS',
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  String _formatCoins(int coins) {
    if (coins >= 1000) {
      return '${(coins / 1000).toStringAsFixed(1)}k';
    }
    return '$coins';
  }
}

class _ProfileAvatar extends StatelessWidget {
  final String avatarUrl;

  const _ProfileAvatar({required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF0A0A0F),
          width: 2.5,
        ),
      ),
      child: ClipOval(
        child: Image.network(
          avatarUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            color: const Color(0xFF1A1A2E),
            child: const Icon(
              Icons.person,
              color: Colors.white38,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}

class _VipBadge extends StatelessWidget {
  final String tier;

  const _VipBadge({required this.tier});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1030),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF7C4DFF).withOpacity(0.6),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7C4DFF).withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star_rounded,
            color: Color(0xFF9C6FFF),
            size: 13,
          ),
          const SizedBox(width: 4),
          Text(
            tier,
            style: const TextStyle(
              color: Color(0xFFB39DDB),
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white38,
            fontSize: 10,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}