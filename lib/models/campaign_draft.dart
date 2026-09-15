enum CampaignPlatform { youtube, tiktok, instagram, x }

enum CampaignGoal { subscribers, views, likes, followers }

class CampaignDraft {
  final CampaignPlatform platform;
  final String contentUrl;
  final CampaignGoal goal;
  final int targetAmount;
  final int watchTimeSeconds;

  const CampaignDraft({
    required this.platform,
    required this.contentUrl,
    required this.goal,
    required this.targetAmount,
    required this.watchTimeSeconds,
  });

  @override
  String toString() {
    return 'CampaignDraft('
        'platform: $platform, '
        'contentUrl: $contentUrl, '
        'goal: $goal, '
        'targetAmount: $targetAmount, '
        'watchTimeSeconds: $watchTimeSeconds)';
  }
}

// ── Pricing constants ──
const int coinsPerUnit = 50;
const int minTargetAmount = 50;
const int maxTargetAmount = 10000;
const int minWatchTime = 15;
const int maxWatchTime = 120;