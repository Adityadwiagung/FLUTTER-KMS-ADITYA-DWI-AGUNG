import 'package:flutter/material.dart';
import 'package:flutter_provider/constant/assets.dart';
import 'package:flutter_provider/theme/theme_color.dart';

class MyGalery extends StatefulWidget {
  const MyGalery({super.key});

  @override
  State<MyGalery> createState() => _MyGaleryState();
}

class _MyGaleryState extends State<MyGalery> {
  List<String> images = [
    Assets.assetsImagesGambar1,
    Assets.assetsImagesGambar2,
    Assets.assetsImagesGambar3,
    Assets.assetsImagesGambar4,
    Assets.assetsImagesGambar5,
    Assets.assetsImagesGambar6,
    Assets.assetsImagesGambar7,
    Assets.assetsImagesGambar8,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 174, 175, 160),
      title: const Text('Galery')
      ),
      drawer: Drawer(
        child: ListView(
          children: [
             DrawerHeader(
              decoration: BoxDecoration(
                color: ThemeColor().m3SysLightPurple90,
              ),
              child: const Text('Navigation'),
            ),
            ListTile(
              title: const Text('Galery Page'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Contact Page'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                context, 
                '/contactProvider',
                );
              },
            ),
          ],
        ),
        
      ),

      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: const Color(0xFFEDDCC0),
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ClipOval(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
                      child: Image.asset(images[index],
                      ),
                    ),
                ), 
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context, 
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Tekan Ya untuk Melihat Lihat Gambar',
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget> [
                              Image.asset(images[index])
                            ],
                          ),
                          actions: [
                            TextButton(onPressed: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(
                                context, 
                                '/detail',
                                arguments: Image.asset(images[index]),
                              );
                            }, child: const Text('Ya')),

                            TextButton(onPressed: () {
                              Navigator.pop(context);
                            }, child: const Text('Tidak')),
                          ],
                        );
                      }
                    );
                  }, 
                  child: const Text("Lihat Gambar"))
              ],
            );
          },
        );
      },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5 ),
          child: Image.asset(
            images[index],
            fit: BoxFit.cover,           
          ),
        ),
      );
    },
    itemCount: images.length,
  ),
      
    );
  }
}

