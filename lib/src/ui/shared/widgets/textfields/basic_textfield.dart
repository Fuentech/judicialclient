import 'package:flutter/material.dart';
import 'package:judicialclient/src/ui/shared/colors/judicial_colors.dart';

class BasicTextfield extends StatelessWidget {
  final IconData iconData;
  final String placeHolder;
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final bool isPassword;
  final void Function(String) onChanged;
  final bool validateInput;
  final String messageValidate;
  final bool autofocus;

  const BasicTextfield(
      {Key? key,
      required this.iconData,
      required this.placeHolder,
      required this.hintText,
      required this.textEditingController,
      this.textInputType = TextInputType.text,
      this.isPassword = false,
      required this.onChanged,
      this.validateInput = true,
      required this.messageValidate,
      this.autofocus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      autocorrect: false,
      autofocus: this.autofocus,
      controller: this.textEditingController,
      keyboardType: this.textInputType,
      obscureText: this.isPassword,
      style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
      cursorHeight: 22,
      cursorColor: judicialColors.judicialYellow(),
      decoration: InputDecoration(
        prefixIcon: Icon(this.iconData),
        hintStyle: TextStyle(
            color: judicialColors.judicialYellow(),
            decorationColor: judicialColors.judicialYellow()),
        contentPadding: EdgeInsets.only(top: 42, left: 15),
        enabledBorder: _outlineInputBorder(),
        focusedBorder: _outlineInputBorder(),
        hintText: this.hintText,
        labelText: this.placeHolder,
        helperText: this.validateInput ? null : this.messageValidate
      ),
      onChanged: this.onChanged,
    );
  }

  OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: judicialColors.judicialYellow()),
        gapPadding: 10);
  }
}
