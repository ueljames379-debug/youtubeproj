import 'package:flutter/material.dart';

class WatchTimeSlider extends StatelessWidget {
  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;

  const WatchTimeSlider({
    super.key,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // ── Label + Value ──
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Watch Time',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${value}s',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),

        // ── Slider ──
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: const Color(0xFF7C4DFF),
            inactiveTrackColor: const Color(0xFF2A2A3A),
            thumbColor: const Color(0xFF7C4DFF),
            overlayColor:
            const Color(0xFF7C4DFF).withOpacity(0.15),
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 10,
            ),
            trackHeight: 3,
          ),
          child: Slider(
            value: value.toDouble(),
            min: min.toDouble(),
            max: max.toDouble(),
            onChanged: (v) => onChanged(v.round()),
          ),
        ),

        // ── Min / Max labels ──
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${min}s',
                style: const TextStyle(
                  color: Colors.white38,
                  fontSize: 11,
                ),
              ),
              Text(
                '${max}s',
                style: const TextStyle(
                  color: Colors.white38,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}