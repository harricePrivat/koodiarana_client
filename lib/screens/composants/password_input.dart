import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// ignore: must_be_immutable
class PasswordInput extends StatefulWidget {
  TextEditingController controller;
  Color color;
  PasswordInput({super.key, required this.controller, required this.color});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      name: "password",
      cursorColor: widget.color,
      controller: widget.controller,
      // placeholder: const Text('*******'),
      obscureText: obscure,
      decoration: InputDecoration(
        label: Text(
          'Mot de passe',
          style: textTheme.titleSmall,
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(width: 0.2),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        hintText: '*******',
        prefix: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ShadImage.square(
            size: 16,
            LucideIcons.lock,
            color: widget.color,
          ),
        ),
        suffix: ShadButton(
          width: 24,
          height: 24,
          padding: EdgeInsets.zero,
          decoration: const ShadDecoration(
            secondaryBorder: ShadBorder.none,
            secondaryFocusedBorder: ShadBorder.none,
          ),
          icon: ShadImage.square(
            size: 16,
            obscure ? LucideIcons.eyeOff : LucideIcons.eye,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() => obscure = !obscure);
          },
        ),
      ),

      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: "Ce champ est obligatoire"),
        FormBuilderValidators.password(
            errorText:
                'au moins 8 caracteres , 1 majuscule, 1 minuscule,1 caracteres speciaux')
      ]),
      style: TextStyle(color: widget.color),
    );
  }
}
