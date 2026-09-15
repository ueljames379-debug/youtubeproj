import 'package:flutter/material.dart';
import '../models/campaign.dart';
import 'campaign_card.dart';

class CampaignCarousel extends StatelessWidget {
  final List<Campaign> campaigns;
  final int currentIndex;
  final ValueChanged<int> onChanged;
  final VoidCallback onTap;

  const CampaignCarousel({
    super.key,
    required this.campaigns,
    required this.currentIndex,
    required this.onChanged,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [

        // ── Campaign Card ──
        GestureDetector(
          onTap: onTap,
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! < 0) {
              // Swipe left → next
              if (currentIndex < campaigns.length - 1) {
                onChanged(currentIndex + 1);
              }
            } else {
              // Swipe right → previous
              if (currentIndex > 0) {
                onChanged(currentIndex - 1);
              }
            }
          },
          child: CampaignCard(campaign: campaigns[currentIndex]),
        ),

        // ── Previous Button ──
        Positioned(
          left: 10,
          child: GestureDetector(
            onTap: () {
              if (currentIndex > 0) {
                onChanged(currentIndex - 1);
              }
            },
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white24,
                  width: 0.8,
                ),
              ),
              child: const Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),

        // ── Next Button ──
        Positioned(
          right: 10,
          child: GestureDetector(
            onTap: () {
              if (currentIndex < campaigns.length - 1) {
                onChanged(currentIndex + 1);
              }
            },
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white24,
                  width: 0.8,
                ),
              ),
              child: const Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),

      ],
    );
  }
}