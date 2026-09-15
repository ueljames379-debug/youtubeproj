import 'package:flutter/material.dart';
import '../../models/task.dart';

class PlatformBadge extends StatelessWidget {
  final TaskPlatform platform;

  const PlatformBadge({super.key, required this.platform});

  String get _label {
    switch (platform) {
      case TaskPlatform.youtube:
        return 'YouTube';
      case TaskPlatform.tiktok:
        return 'TikTok';
      case TaskPlatform.instagram:
        return 'Instagram';
    }
  }

  Color get _dotColor {
    switch (platform) {
      case TaskPlatform.youtube:
        return Colors.red;
      case TaskPlatform.tiktok:
        return Colors.pinkAccent;
      case TaskPlatform.instagram:
        return Colors.purpleAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.65),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white24,
          width: 0.8,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          // ── Colored dot ──
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: _dotColor,
              shape: BoxShape.circle,
            ),
          ),

          const SizedBox(width: 6),

          Text(
            _label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),

        ],
      ),
    );
  }
}