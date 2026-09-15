enum TaskPlatform { youtube, tiktok, instagram }

class Task {
  final String id;
  final TaskPlatform platform;
  final String title;
  final String creatorName;
  final String imageUrl;
  final String avatarUrl;
  final int reward;

  const Task({
    required this.id,
    required this.platform,
    required this.title,
    required this.creatorName,
    required this.imageUrl,
    required this.avatarUrl,
    required this.reward,
  });
}

const List<Task> mockTasks = [
  Task(
    id: 'task_001',
    platform: TaskPlatform.youtube,
    title: 'Subscribe to Channel',
    creatorName: 'TechReviewer Pro',
    imageUrl:
    'https://images.unsplash.com/photo-1593642632559-0c6d3fc62b89?w=800',
    avatarUrl:
    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
    reward: 45,
  ),
  Task(
    id: 'task_002',
    platform: TaskPlatform.youtube,
    title: 'Like & Comment Video',
    creatorName: 'GamingWithAlex',
    imageUrl:
    'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=800',
    avatarUrl:
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
    reward: 30,
  ),
  Task(
    id: 'task_003',
    platform: TaskPlatform.youtube,
    title: 'Watch Full Video',
    creatorName: 'MusicVibes Daily',
    imageUrl:
    'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=800',
    avatarUrl:
    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200',
    reward: 20,
  ),
];