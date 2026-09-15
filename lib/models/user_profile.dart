class UserProfile {
  final String name;
  final String username;
  final String avatarUrl;
  final String headerImageUrl;
  final int tasks;
  final int coins;
  final String vipTier;

  const UserProfile({
    required this.name,
    required this.username,
    required this.avatarUrl,
    required this.headerImageUrl,
    required this.tasks,
    required this.coins,
    required this.vipTier,
  });
}

final mockUser = UserProfile(
  name: 'Alex Rivers',
  username: '@arrivers_tech',
  avatarUrl:
  'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
  headerImageUrl:
  'https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?w=800',
  tasks: 156,
  coins: 12400,
  vipTier: 'GOLD',
);