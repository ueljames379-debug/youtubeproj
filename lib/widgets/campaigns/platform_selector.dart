import 'package:flutter/material.dart';
import '../../models/campaign_draft.dart';

class PlatformSelector extends StatelessWidget {
  final CampaignPlatform selected;
  final ValueChanged<CampaignPlatform> onChanged;

  const PlatformSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SELECT PLATFORM',
          style: TextStyle(
            color: Colors.white38,
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.3,
          ),
        ),

        const SizedBox(height: 10),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: CampaignPlatform.values.map((platform) {
            return _PlatformChip(
              platform: platform,
              isSelected: selected == platform,
              onTap: () => onChanged(platform),
            );
          }).toList(),
        ),

      ],
    );
  }
}

class _PlatformChip extends StatelessWidget {
  final CampaignPlatform platform;
  final bool isSelected;
  final VoidCallback onTap;

  const _PlatformChip({
    required this.platform,
    required this.isSelected,
    required this.onTap,
  });

  String get _label {
    switch (platform) {
      case CampaignPlatform.youtube:
        return 'YouTube';
      case CampaignPlatform.tiktok:
        return 'TikTok';
      case CampaignPlatform.instagram:
        return 'Instagram';
      case CampaignPlatform.x:
        return 'X';
    }
  }

  Color get _dotColor {
    switch (platform) {
      case CampaignPlatform.youtube:
        return Colors.red;
      case CampaignPlatform.tiktok:
        return Colors.pinkAccent;
      case CampaignPlatform.instagram:
        return Colors.purpleAccent;
      case CampaignPlatform.x:
        return Colors.white70;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF7C4DFF).withOpacity(0.15)
              : const Color(0xFF1A1A2A),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF7C4DFF)
                : Colors.white12,
            width: isSelected ? 1.5 : 0.8,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
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
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : Colors.white60,
                fontSize: 13,
                fontWeight: isSelected
                    ? FontWeight.w600
                    : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}