import 'package:flutter/material.dart';
import '../../models/task.dart';

class TaskInfoOverlay extends StatelessWidget {
  final Task task;

  const TaskInfoOverlay({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        // ── Creator Avatar ──
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFF9C6FFF),
              width: 2,
            ),
          ),
          child: ClipOval(
            child: Image.network(
              task.avatarUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: const Color(0xFF1A1A2E),
                child: const Icon(
                  Icons.person,
                  color: Colors.white38,
                  size: 24,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        // ── Title + Creator Name ──
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                task.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                task.creatorName,
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),

            ],
          ),
        ),

      ],
    );
  }
}