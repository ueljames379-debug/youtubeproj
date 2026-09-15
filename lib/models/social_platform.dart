import 'package:flutter/material.dart';

enum PlatformStatus { connected, notConnected }

class SocialPlatform {
  final String name;
  final String username;
  final String iconAsset;
  final PlatformStatus status;
  final Color iconBgColor;

  const SocialPlatform({
    required this.name,
    required this.username,
    required this.iconAsset,
    required this.status,
    required this.iconBgColor,
  });
}

final List<SocialPlatform> mockPlatforms = [
  SocialPlatform(
    name: 'YouTube',
    username: 'AlexRiversTech',
    iconAsset: 'youtube',
    status: PlatformStatus.connected,
    iconBgColor: const Color(0xFF3D1515),
  ),
  SocialPlatform(
    name: 'TikTok',
    username: '@arrivers_tech',
    iconAsset: 'tiktok',
    status: PlatformStatus.connected,
    iconBgColor: const Color(0xFF0D2E2E),
  ),
  SocialPlatform(
    name: 'Instagram',
    username: 'Not connected',
    iconAsset: 'instagram',
    status: PlatformStatus.notConnected,
    iconBgColor: const Color(0xFF3D1515),
  ),
];