import 'package:flutter/material.dart';

class TextfieldGlobal extends StatelessWidget {
  final String? title;
  final TextInputType? inputType;
  final String? placeholder;
  final ValueChanged<String>? onChanged;

  const TextfieldGlobal({
    super.key,
    this.title,
    this.inputType,
    this.placeholder,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8.0),
        TextField(
          decoration: InputDecoration(
            labelText: placeholder ?? '...',
            border: const OutlineInputBorder(),
          ),
          keyboardType: inputType ?? TextInputType.none,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
