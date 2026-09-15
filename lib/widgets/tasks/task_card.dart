import 'package:flutter/material.dart';
import '../../models/task.dart';
import 'platform_badge.dart';
import 'task_info_overlay.dart';
import 'start_task_button.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback onStartTask;

  const TaskCard({
    super.key,
    required this.task,
    required this.onStartTask,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0E0E18),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white12,
          width: 0.8,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [

            // ── Task Image ──
            _TaskImage(imageUrl: task.imageUrl),

            // ── Bottom gradient overlay ──
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 260,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.85),
                      Colors.black.withOpacity(0.98),
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),

            // ── Platform Badge top-right ──
            Positioned(
              top: 14,
              right: 14,
              child: PlatformBadge(platform: task.platform),
            ),

            // ── Info overlay bottom ──
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    // ── Avatar + Title + Creator ──
                    TaskInfoOverlay(task: task),

                    const SizedBox(height: 16),

                    // ── Start Task Button ──
                    StartTaskButton(onTap: onStartTask),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class _TaskImage extends StatelessWidget {
  final String imageUrl;

  const _TaskImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          color: const Color(0xFF12121A),
          child: const Center(
            child: CircularProgressIndicator(
              color: Color(0xFF7C4DFF),
              strokeWidth: 2,
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: const Color(0xFF12121A),
          child: const Center(
            child: Icon(
              Icons.image_outlined,
              color: Colors.white24,
              size: 48,
            ),
          ),
        );
      },
    );
  }
}