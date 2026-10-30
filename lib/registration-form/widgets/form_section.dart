
import 'package:flutter/material.dart';

class FormSection extends StatelessWidget {
  final String title;
  final Widget child;

  const FormSection({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 30),

        child,

        const SizedBox(height: 10),
      ],
    );
  }
}
