import 'package:flutter/material.dart';
import '../../screens/profile_screen.dart';

class ProfileTabBar extends StatelessWidget {
  final ProfileTab selected;
  final ValueChanged<ProfileTab> onTabSelected;

  const ProfileTabBar({
    super.key,
    required this.selected,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Tab(
          label: 'Platforms',
          isSelected: selected == ProfileTab.platforms,
          onTap: () => onTabSelected(ProfileTab.platforms),
        ),
        _Tab(
          label: 'Preferences',
          isSelected: selected == ProfileTab.preferences,
          onTap: () => onTabSelected(ProfileTab.preferences),
        ),
        _Tab(
          label: 'VIP',
          isSelected: selected == ProfileTab.vip,
          onTap: () => onTabSelected(ProfileTab.vip),
        ),
      ],
    );
  }
}

class _Tab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _Tab({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 24, bottom: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                label,
                style: TextStyle(
                  color: isSelected
                      ? const Color(0xFF9C6FFF)
                      : Colors.white38,
                  fontSize: 14,
                  fontWeight: isSelected
                      ? FontWeight.w700
                      : FontWeight.w500,
                ),
              ),
            ),

            // Underline
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2,
              width: isSelected ? label.length * 8.5 : 0,
              decoration: BoxDecoration(
                color: const Color(0xFF7C4DFF),
                borderRadius: BorderRadius.circular(2),
              ),
            ),

          ],
        ),
      ),
    );
  }
}