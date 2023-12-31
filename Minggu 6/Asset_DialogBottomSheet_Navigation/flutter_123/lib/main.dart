import 'package:flutter/material.dart';
import 'package:flutter_123/contact/contact_page.dart';
import 'package:flutter_123/detail_image.dart';
import 'package:flutter_123/galery_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/contact',
      routes: {
        '/': (_) => const MyGalery(),
        '/detail': (_) => const DetailImage(),
        '/contact': (_) => const ContactPage(),
      },
    );
  }
}


