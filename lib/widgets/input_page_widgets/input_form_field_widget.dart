import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_jug_riddle/constants/constants.dart';

class InputFormFieldWidget extends StatelessWidget {
  final String hint;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> fieldValidator;
  final int? initialValue;
  final TextInputAction textInputAction;

  const InputFormFieldWidget(
      this.hint, this.onChanged, this.fieldValidator, this.initialValue,
      {Key? key, this.textInputAction = TextInputAction.next})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ConstantsTheme.kSpacingX05),
      child: TextFormField(
        //keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        textInputAction: textInputAction,
        initialValue: initialValue == null ? '' : initialValue.toString(),
        onChanged: onChanged,
        validator: fieldValidator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          filled: true,
          icon: const Icon(Icons.label),
          border: const UnderlineInputBorder(),
          labelText: hint,
        ),
      ),
    );
  }
}
