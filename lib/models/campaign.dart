class Campaign {
  final String title;
  final String imageUrl;
  final int rewardCoins;
  final double progress;
  final String platform;

  const Campaign({
    required this.title,
    required this.imageUrl,
    required this.rewardCoins,
    required this.progress,
    required this.platform,
  });
}

final List<Campaign> mockCampaigns = [
  Campaign(
    title: 'Tech Review Mastery',
    imageUrl: 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=800',
    rewardCoins: 500,
    progress: 0.75,
    platform: 'YOUTUBE',
  ),
  Campaign(
    title: 'Gaming Channel Growth',
    imageUrl: 'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=800',
    rewardCoins: 350,
    progress: 0.45,
    platform: 'YOUTUBE',
  ),
  Campaign(
    title: 'Music Viral Boost',
    imageUrl: 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=800',
    rewardCoins: 700,
    progress: 0.60,
    platform: 'YOUTUBE',
  ),
  Campaign(
    title: 'Travel Vlog Promo',
    imageUrl: 'https://images.unsplash.com/photo-1506929562872-bb421503ef21?w=800',
    rewardCoins: 420,
    progress: 0.30,
    platform: 'YOUTUBE',
  ),
  Campaign(
    title: 'Cooking Show Reach',
    imageUrl: 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=800',
    rewardCoins: 280,
    progress: 0.90,
    platform: 'YOUTUBE',
  ),
];