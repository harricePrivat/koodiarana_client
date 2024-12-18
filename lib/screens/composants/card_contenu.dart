import 'package:flutter/material.dart';

class CardContenu extends StatelessWidget {
  final Widget? icon;
  final String? nom;
  const CardContenu({super.key, this.icon, this.nom});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: icon,
            )),
            // const SizedBox(
            //   height: 10.00,
            // ),
            Text(
              nom!,
              maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
