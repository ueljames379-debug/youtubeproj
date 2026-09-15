import 'package:flutter/material.dart';
import '../../models/campaign_draft.dart';

class CampaignGoalSelector extends StatelessWidget {
  final CampaignGoal selected;
  final ValueChanged<CampaignGoal> onChanged;

  const CampaignGoalSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  String _label(CampaignGoal goal) {
    switch (goal) {
      case CampaignGoal.subscribers:
        return 'Subscribers';
      case CampaignGoal.views:
        return 'Views';
      case CampaignGoal.likes:
        return 'Likes';
      case CampaignGoal.followers:
        return 'Followers';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          'Campaign Goal',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0E0E18),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white12,
              width: 0.8,
            ),
          ),
          child: Row(
            children: CampaignGoal.values.map((goal) {
              final isSelected = selected == goal;
              final isFirst = goal == CampaignGoal.values.first;
              final isLast = goal == CampaignGoal.values.last;

              return Expanded(
                child: GestureDetector(
                  onTap: () => onChanged(goal),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF7C4DFF)
                          : Colors.transparent,
                      borderRadius: BorderRadius.horizontal(
                        left: isFirst
                            ? const Radius.circular(10)
                            : Radius.zero,
                        right: isLast
                            ? const Radius.circular(10)
                            : Radius.zero,
                      ),
                    ),
                    child: Text(
                      _label(goal),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : Colors.white38,
                        fontSize: 12,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),

      ],
    );
  }
}