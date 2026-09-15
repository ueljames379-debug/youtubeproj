import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xFF0A0A0F),
          border: Border(
            bottom: BorderSide(
              color: Colors.white.withOpacity(0.08),
              width: 0.8,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // ── Left: Hub icon ──
              const Icon(
                Icons.hub_outlined,
                color: Color(0xFF9C6FFF),
                size: 26,
              ),

              // ── Center: NEXUS title ──
              const Text(
                'NEXUS',
                style: TextStyle(
                  color: Color(0xFF9C6FFF),
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 3,
                ),
              ),

              // ── Right: Bell icon ──
              const Icon(
                Icons.notifications_outlined,
                color: Colors.white60,
                size: 24,
              ),

            ],
          ),
        ),
      ),
    );
  }
}