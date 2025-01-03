import 'package:flutter/material.dart';

class QuestionTile extends StatelessWidget {
  final String question;
  final bool? value;
  final ValueChanged<bool?> onChanged;

  const QuestionTile({super.key, 
    required this.question,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(question),
        Row(
          children: [
            Expanded(
              child: RadioListTile<bool>(
                title: const Text('Ya'),
                value: true,
                groupValue: value,
                onChanged: onChanged,
              ),
            ),
            Expanded(
              child: RadioListTile<bool>(
                title: const Text('Tidak'),
                value: false,
                groupValue: value,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
