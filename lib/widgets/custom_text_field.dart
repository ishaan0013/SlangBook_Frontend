import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  final Function validate;

  final Function save;

  const CustomTextField(
      {Key? key,
      required this.hint,
      required this.controller,
      required this.validate,
      required this.save})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (v) => validate(v),
      onSaved: (v) => save(v),
      decoration: InputDecoration(
        fillColor: const Color(0xffF9F9F9),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        hintText: hint,
      ),
    );
  }
}
