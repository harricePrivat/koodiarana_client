import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

typedef OnChanged = void Function(ShadTimeOfDay);

// ignore: must_be_immutable
class TimePicker extends StatefulWidget {
  String? label;
  OnChanged? changeTimeOfDay;
  TimePicker({super.key,required this.label, required this.changeTimeOfDay});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
       widget.label!,
          style: textTheme.bodyMedium,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ShadTimePicker(
            initialValue: ShadTimeOfDay.now(),
            onChanged: widget.changeTimeOfDay,
            jumpToNextFieldWhenFilled: true,
            trailing: Padding(
              padding: EdgeInsets.only(left: 8, top: 14),
              child: ShadImage.square(LucideIcons.clock4, size: 16),
            ),
          ),
        )
      ],
    );
  }
}
