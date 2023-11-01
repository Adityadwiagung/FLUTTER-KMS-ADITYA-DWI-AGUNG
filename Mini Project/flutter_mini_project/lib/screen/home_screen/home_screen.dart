import 'package:flutter/material.dart';
import 'package:flutter_mini_project/constant/assets.dart';
import 'package:flutter_mini_project/screen/doa_screen/doa_list_screen.dart';
import 'package:flutter_mini_project/screen/hadist_screen/hadist_list_screen.dart';
import 'package:flutter_mini_project/screen/quran_screen/quran_list_screen.dart';
import 'package:flutter_mini_project/theme/theme_color.dart';
import 'package:flutter_mini_project/theme/theme_text.dart';
import 'package:flutter_mini_project/widget/column_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor().whiteEgg,
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.assetsImagesQuranbg),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 85),
              child: Column(
                children: [
                  Text("Islamic",
                    style: ThemeTextStyle().textLarge,
                  ),
                  Text("Center",
                    style: ThemeTextStyle().textLarge,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset(
                Assets.assetsImagesQuranlogo,
                width: 330,
                height: 330,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 40, left: 16, right: 16),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 5,
                      color: ThemeColor().brown
                    ),
                    boxShadow: [
                  BoxShadow(
                    color: ThemeColor().brown.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(2, 5),
                  ),
                ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ColumnWidget(
                                screenWidget: const HadistListScreen(),
                                imageAsset: Image.asset(
                                  Assets.assetsImagesHadistcover,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                textContent: "Hadist"),
                              ColumnWidget(
                                screenWidget: const QuranListScreen(),
                                imageAsset: Image.asset(
                                  Assets.assetsImagesQurancover,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                textContent: "Al-Qur'an"),
                              ColumnWidget(
                                screenWidget: const DoaScreenList(),
                                imageAsset: Image.asset(
                                    Assets.assetsImagesDoacover,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                textContent: "Do'a Harian")
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}