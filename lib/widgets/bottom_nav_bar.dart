import 'package:flutter/material.dart';
import '../screens/profile_screen.dart';
import '../screens/wallet_screen.dart';
import '../screens/tasks_screen.dart';
import '../screens/new_promotion_screen.dart';
import '../models/wallet.dart';

class DashboardBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const DashboardBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0E0E18),
        border: Border(
          top: BorderSide(
            color: Colors.white.withOpacity(0.08),
            width: 0.8,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              // ── Home ──
              _NavItem(
                icon: Icons.grid_view_rounded,
                label: 'Home',
                selected: selectedIndex == 0,
                onTap: () => onTap(0),
              ),

              // ── Campaigns → navigates to NewPromotionScreen ──
              _NavItem(
                icon: Icons.rocket_launch_outlined,
                label: 'Campaigns',
                selected: selectedIndex == 1,
                onTap: () {
                  onTap(1);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const NewPromotionScreen(),
                    ),
                  ).then((_) => onTap(0));
                },
              ),

              // ── Tasks → navigates to TasksScreen ──
              _NavItem(
                icon: Icons.assignment_outlined,
                label: 'Tasks',
                selected: selectedIndex == 2,
                onTap: () {
                  onTap(2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TasksScreen(),
                    ),
                  ).then((_) => onTap(0));
                },
              ),

              // ── Wallet → navigates to WalletScreen ──
              _NavItem(
                icon: Icons.account_balance_wallet_outlined,
                label: 'Wallet',
                selected: selectedIndex == 3,
                onTap: () {
                  onTap(3);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          WalletScreen(wallet: mockWallet),
                    ),
                  ).then((_) => onTap(0));
                },
              ),

              // ── Profile → navigates to ProfileScreen ──
              _NavItem(
                icon: Icons.person_rounded,
                label: 'Profile',
                selected: selectedIndex == 4,
                onTap: () {
                  onTap(4);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  ).then((_) => onTap(0));
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color =
    selected ? const Color(0xFF7C4DFF) : Colors.white38;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight:
                selected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}