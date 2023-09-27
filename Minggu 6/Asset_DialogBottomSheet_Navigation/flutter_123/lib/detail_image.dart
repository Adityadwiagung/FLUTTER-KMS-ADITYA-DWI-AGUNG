import 'package:flutter/material.dart';


class DetailImage extends StatelessWidget {
  const DetailImage({super.key});

  @override
  Widget build(BuildContext context) {
    final parameter = ModalRoute.of(context)!.settings.arguments as Image;
    return Scaffold(
      backgroundColor: const Color(0xFFEDDCC0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 174, 175, 160),
        title: const Text('Detail Gambar'),
      ),
      body: Center(
        child: Column(
          children: [
            parameter,
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                context, 
                '/',
                (_) => false
                );
              },
              child: const Text('Galery'),
            ),
          ],
        ),
      ),
    );
  }
}