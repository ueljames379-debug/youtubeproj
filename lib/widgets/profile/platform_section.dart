import 'package:flutter/material.dart';
import '../../models/social_platform.dart';
import 'platform_connection_card.dart';

class PlatformSection extends StatelessWidget {
  final List<SocialPlatform> platforms;
  final ValueChanged<SocialPlatform> onPlatformTap;
  final ValueChanged<SocialPlatform> onConnectPlatform;

  const PlatformSection({
    super.key,
    required this.platforms,
    required this.onPlatformTap,
    required this.onConnectPlatform,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF12121A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white12, width: 0.8),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: platforms.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final platform = platforms[index];
          return PlatformConnectionCard(
            platform: platform,
            onTap: () => platform.status == PlatformStatus.connected
                ? onPlatformTap(platform)
                : onConnectPlatform(platform),
          );
        },
      ),
    );
  }
}