import 'package:flutter/material.dart';

class Inputfield extends StatefulWidget {
  const Inputfield(
    {
    super.key,
    required this.fieldName,
    required this.controller,
    required this.icons, required this.showPassword,
  });
  final String fieldName;
  final TextEditingController controller;
  final Icon icons;
  final bool showPassword;

  @override
  State<Inputfield> createState() => _InputfieldState();
}

class _InputfieldState extends State<Inputfield> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
            label: Text(widget.fieldName),
            prefixIcon: widget.icons,
            suffixIcon: widget.showPassword
                ? IconButton(
                    onPressed: () => setState(() {
                          _obscureText = !_obscureText;
                        }),
                    icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility))
                : null));
  }
}
