import 'package:flutter/material.dart';
import '../models/user_profile.dart';
import '../models/social_platform.dart';
import '../widgets/profile/profile_app_bar.dart';
import '../widgets/profile/profile_summary_card.dart';
import '../widgets/profile/profile_tab_bar.dart';
import '../widgets/profile/platform_section.dart';
import '../widgets/bottom_nav_bar.dart';

enum ProfileTab { platforms, preferences, vip }

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileTab _selectedTab = ProfileTab.platforms;
  int _selectedNav = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      body: Column(
        children: [

          // ── Fixed App Bar ──
          const ProfileAppBar(),

          // ── Scrollable Content ──
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 12),

                  // ── Profile Summary Card ──
                  ProfileSummaryCard(user: mockUser),

                  const SizedBox(height: 16),

                  // ── Profile Tab Bar ──
                  ProfileTabBar(
                    selected: _selectedTab,
                    onTabSelected: (tab) {
                      setState(() => _selectedTab = tab);
                    },
                  ),

                  const SizedBox(height: 12),

                  // ── Tab Content ──
                  if (_selectedTab == ProfileTab.platforms)
                    PlatformSection(
                      platforms: mockPlatforms,
                      onPlatformTap: (platform) {
                        // TODO: open manage platform screen
                      },
                      onConnectPlatform: (platform) {
                        // TODO: open OAuth connect flow
                      },
                    ),

                  if (_selectedTab == ProfileTab.preferences)
                    const _PreferencesPlaceholder(),

                  if (_selectedTab == ProfileTab.vip)
                    const _VipPlaceholder(),

                  const SizedBox(height: 20),

                ],
              ),
            ),
          ),

          // ── Fixed Bottom Navigation ──
          DashboardBottomNav(
            selectedIndex: _selectedNav,
            onTap: (index) {
              setState(() => _selectedNav = index);
              if (index == 0) {
                Navigator.pop(context);
              }
            },
          ),

        ],
      ),
    );
  }
}

class _PreferencesPlaceholder extends StatelessWidget {
  const _PreferencesPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF12121A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12, width: 0.8),
      ),
      child: const Center(
        child: Text(
          'Preferences coming soon',
          style: TextStyle(color: Colors.white38, fontSize: 14),
        ),
      ),
    );
  }
}

class _VipPlaceholder extends StatelessWidget {
  const _VipPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF12121A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12, width: 0.8),
      ),
      child: const Center(
        child: Text(
          'VIP details coming soon',
          style: TextStyle(color: Colors.white38, fontSize: 14),
        ),
      ),
    );
  }
}