import 'package:flutter/material.dart';
import 'package:flutter_mini_project/constant/assets.dart';
import 'package:flutter_mini_project/theme/theme_color.dart';
import 'package:flutter_mini_project/theme/theme_text.dart';

class ContainerWidget extends StatelessWidget {
  final String title;
  const ContainerWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 10,
        height: MediaQuery.of(context).size.width / 10,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.assetsImagesRing)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: ThemeTextStyle().textSmall2,
            ),
          ],
        ),
      );
  }
}

class ContainerWidget2 extends StatelessWidget {
  final String title;
  const ContainerWidget2({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: ThemeColor().darkBrown
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
                style: ThemeTextStyle().textSmall3
          ),
        ],
      ),
    );
  }
}