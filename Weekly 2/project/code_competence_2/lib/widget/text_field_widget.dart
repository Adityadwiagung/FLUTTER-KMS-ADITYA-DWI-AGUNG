import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final int? maxLines;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? errorText;
  final Function(String)? onChanged;
  const TextFieldWidget({
    super.key,
    required this.label,
    this.maxLines,
    this.controller,
    this.textInputType,
    this.errorText,
    required this.onChanged,
    
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 16
      ),
      child: TextField(
        maxLines: maxLines,
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          filled: true,
          errorText: errorText,
          labelStyle: GoogleFonts.montserrat(),
          label: Text(label),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        onChanged: onChanged,
      ),
    );
  }
}