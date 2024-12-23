import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// ignore: must_be_immutable
class TextArea extends StatefulWidget {
  TextEditingController controller;
  String? label;
  TextArea({super.key, this.label, required this.controller});

  @override
  State<TextArea> createState() => _TextAreaState();
}

class _TextAreaState extends State<TextArea> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      spacing: 8,
      children: [
        Text(widget.label!, style: textTheme.bodyLarge),
        ShadInputFormField(
          controller: widget.controller,
          maxLines: 3,
          style: textTheme.titleSmall,
          decoration: const ShadDecoration(
            border: ShadBorder(),
          ),
          validator: (v) {
            if (v.isEmpty) return 'ce champ est obligatoire';
            return null;
          },
        )
      ],
    );
  }
}
