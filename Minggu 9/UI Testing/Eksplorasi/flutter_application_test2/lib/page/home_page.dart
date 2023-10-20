import 'package:flutter_application_test2/constant/assets.dart';
import 'package:flutter_application_test2/page/contact_page.dart';
import 'package:flutter_application_test2/page/header_page.dart';
import 'package:flutter_application_test2/page/welcome_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> images = [
    Assets.assetsImages1,
    Assets.assetsImages2,
    Assets.assetsImages3,
    Assets.assetsImages4,
    Assets.assetsImages5,
    Assets.assetsImages6,
    Assets.assetsImages7,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:  [
          const HeaderPage(),
          const WelcomePage(),
          SizedBox(
            height: 190,
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context, 
                      builder: (context) {
                        return AlertDialog(
                          content: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(images[index],
                            fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }
                    );
                  },
                    child: Padding(
                    padding: const EdgeInsets.only(left: 2, right: 2, top: 8),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        ),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
                
              },
              itemCount: 5,
            ),
          ),
           const ContactPage()
        ],
      ),
    );
  }
}
       