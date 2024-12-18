import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InfoPlace extends StatelessWidget {
  String title;
  Object data;
  InfoPlace({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller =
        TextEditingController(text: data.toString());
    final textTheme = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.all(5.00),
      elevation: 5.00,
      child: Column(
        children: [
          Text(title, style: textTheme.bodyLarge),
          TextField(
            controller: controller,
            maxLines: 5,
            enabled: false,
            style: textTheme.titleSmall,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
