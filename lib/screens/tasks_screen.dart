import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/profile/profile_app_bar.dart';
import '../widgets/tasks/task_card.dart';
import '../widgets/tasks/task_empty_state.dart';
import '../widgets/bottom_nav_bar.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final List<Task> _tasks = mockTasks;
  int _currentIndex = 0;
  int _selectedNav = 2;

  Task? get _currentTask =>
      _tasks.isNotEmpty ? _tasks[_currentIndex] : null;

  void _onNextTask() {
    if (_tasks.isEmpty) return;
    setState(() {
      _currentIndex = (_currentIndex + 1) % _tasks.length;
    });
  }

  void _onStartTask(Task task) {
    // TODO: Initiate task completion flow
    debugPrint('Start task: ${task.id}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      body: Column(
        children: [

          // ── Fixed App Bar ──
          const ProfileAppBar(),

          // ── Content ──
          Expanded(
            child: _currentTask == null
                ? const TaskEmptyState()
                : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // ── Task Card ──
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        bottom: 12,
                      ),
                      child: TaskCard(
                        task: _currentTask!,
                        onStartTask: () =>
                            _onStartTask(_currentTask!),
                      ),
                    ),
                  ),

                  // ── Next Button ──
                  _NextButton(onTap: _onNextTask),

                  const SizedBox(height: 20),

                ],
              ),
            ),
          ),

          // ── Fixed Bottom Navigation ──
          DashboardBottomNav(
            selectedIndex: _selectedNav,
            onTap: (index) {
              setState(() => _selectedNav = index);
              if (index == 0) Navigator.pop(context);
            },
          ),

        ],
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  final VoidCallback onTap;

  const _NextButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          color: const Color(0xFFE53935),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFE53935).withOpacity(0.35),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Next',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.chevron_right,
              color: Colors.white,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}