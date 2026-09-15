import 'package:flutter/material.dart';
import '../../models/social_platform.dart';

class PlatformConnectionCard extends StatelessWidget {
  final SocialPlatform platform;
  final VoidCallback onTap;

  const PlatformConnectionCard({
    super.key,
    required this.platform,
    required this.onTap,
  });

  IconData get _icon {
    switch (platform.name) {
      case 'YouTube':
        return Icons.play_circle_outline;
      case 'TikTok':
        return Icons.music_note;
      case 'Instagram':
        return Icons.camera_alt_outlined;
      default:
        return Icons.link;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isConnected = platform.status == PlatformStatus.connected;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFF0E0E18),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white10, width: 0.8),
        ),
        child: Row(
          children: [

            // ── Platform Icon ──
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: platform.iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _icon,
                color: Colors.white70,
                size: 20,
              ),
            ),

            const SizedBox(width: 12),

            // ── Platform Name + Username ──
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    platform.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    platform.username,
                    style: TextStyle(
                      color: isConnected
                          ? Colors.white38
                          : Colors.white24,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            // ── Status / Action ──
            Text(
              isConnected ? 'Connected' : 'Connect',
              style: TextStyle(
                color: isConnected
                    ? const Color(0xFF7C4DFF)
                    : Colors.red,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),

          ],
        ),
      ),
    );
  }
}