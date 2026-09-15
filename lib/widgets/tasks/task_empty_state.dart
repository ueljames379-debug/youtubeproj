import 'package:flutter/material.dart';

class TaskEmptyState extends StatelessWidget {
  const TaskEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [

          Icon(
            Icons.assignment_outlined,
            color: Colors.white24,
            size: 56,
          ),

          SizedBox(height: 16),

          Text(
            'No tasks available right now.',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 8),

          Text(
            'Check back soon for new tasks.',
            style: TextStyle(
              color: Colors.white24,
              fontSize: 13,
            ),
          ),

        ],
      ),
    );
  }
}