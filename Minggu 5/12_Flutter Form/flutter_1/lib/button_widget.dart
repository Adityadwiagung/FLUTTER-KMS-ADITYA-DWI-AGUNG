import 'package:flutter/material.dart';
import 'package:flutter_1/theme_color.dart';
import 'package:flutter_1/theme_text_style.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function()? onPressed;


  const ButtonWidget({super.key, required this.title, required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThemeColor().m3SysLightPurple,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: ThemeTextStyle().m3LabelLarge,
      )
    );
  }
}