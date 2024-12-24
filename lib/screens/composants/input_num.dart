import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// ignore: must_be_immutable
class InputNum extends StatelessWidget {
  TextEditingController controller;
   InputNum({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return ShadInputFormField(
      controller: controller,
      label: Text("entrez votre numéro de téléphone *"),
      placeholder: Text("entrez votre numero de téléphone"),
      decoration: ShadDecoration(
          border: ShadBorder(
        top: BorderSide(color: Colors.grey),
        bottom: BorderSide(color: Colors.grey),
        left: BorderSide(color: Colors.grey),
        right: BorderSide(color: Colors.grey),
      )),
      keyboardType: TextInputType.phone,
      validator: (v) {
        if (v.length < 10) {
          return 'nombre insuffisant';
        } else if (v.length > 10) {
          return 'nombre trop élevé';
        }
        return null;
      },
    );
  }
}
