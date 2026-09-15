import 'package:flutter/material.dart';

class ContentUrlField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;

  const ContentUrlField({
    super.key,
    required this.controller,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          'Content URL',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          controller: controller,
          keyboardType: TextInputType.url,
          style: const TextStyle(
            color: Color(0xFF1A1A2A),
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: 'https://',
            hintStyle: const TextStyle(
              color: Colors.black38,
              fontSize: 14,
            ),
            prefixIcon: const Icon(
              Icons.link,
              color: Colors.black38,
              size: 20,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            errorText: errorText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xFF7C4DFF),
                width: 1.5,
              ),
            ),
          ),
        ),

      ],
    );
  }
}