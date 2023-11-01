import 'package:flutter/material.dart';
import 'package:flutter_mini_project/theme/theme_color.dart';
import 'package:flutter_mini_project/theme/theme_text.dart';

class ColumnWidget extends StatelessWidget {
  final Widget screenWidget;
  final Widget imageAsset;
  final String textContent;

  const ColumnWidget({super.key, 
    required this.screenWidget,
    required this.imageAsset,
    required this.textContent, 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => screenWidget,
            ),
          ),
          child: Container(
            height: 115,
            width: 96,
            decoration: BoxDecoration(
              color: ThemeColor().whiteColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                imageAsset,
              ],
            ),
          ),
        ),
        Expanded(
          child: Text(
            textContent,
            style: ThemeTextStyle().textSmalll,
          ),
        ),
      ],
    );
  }
}
