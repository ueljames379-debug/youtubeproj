import 'package:flutter/material.dart';
import 'models/campaign.dart';
import 'widgets/balance_header.dart';
import 'widgets/vip_status_card.dart';
import 'widgets/campaign_carousel.dart';
import 'widgets/quick_actions.dart';
import 'widgets/bottom_nav_bar.dart';
import 'add_coins_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedNav = 0;
  int _currentCampaign = 0;

  void _navigateTo(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      body: SafeArea(
        child: Column(
          children: [

            // ── Scrollable content ──
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 16),

                    // ── Balance Header ──
                    BalanceHeader(
                      balance: 2450,
                      onAddCoin: () => _navigateTo(
                        const AddCoinsScreen(currentBalance: 2450),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ── VIP Status Card ──
                    VipStatusCard(
                      onUpgrade: () {
                        // TODO: Navigate to VIP upgrade
                      },
                    ),

                    const SizedBox(height: 20),

                    // ── Featured Campaign Header ──
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'FEATURED CAMPAIGN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E1E2E),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white12,
                              width: 0.8,
                            ),
                          ),
                          child: Text(
                            '${_currentCampaign + 1} of ${mockCampaigns.length}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // ── Campaign Carousel ──
                    CampaignCarousel(
                      campaigns: mockCampaigns,
                      currentIndex: _currentCampaign,
                      onChanged: (index) {
                        setState(() => _currentCampaign = index);
                      },
                      onTap: () {
                        // TODO: Navigate to campaign detail
                      },
                    ),

                    const SizedBox(height: 20),

                    // ── Quick Actions ──
                    QuickActions(
                      onCreate: () {},
                      onTasks: () {},
                      onRefer: () {},
                      onBuyCoins: () {},
                    ),

                    const SizedBox(height: 20),

                  ],
                ),
              ),
            ),

            // ── Bottom Navigation ──
            DashboardBottomNav(
              selectedIndex: _selectedNav,
              onTap: (index) {
                setState(() => _selectedNav = index);
              },
            ),

          ],
        ),
      ),
    );
  }
}