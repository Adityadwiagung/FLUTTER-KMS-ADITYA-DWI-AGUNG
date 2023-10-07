import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eksplorasi_1/bloc/galery_bloc/bloc/galery_bloc.dart';
import 'package:flutter_eksplorasi_1/pages/detail_image.dart';
import 'package:flutter_eksplorasi_1/pages/galery_screen.dart';

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
      initialRoute: '/',
      routes: {
        '/': (_) => BlocProvider(
              create: (context) => GaleryBloc(), 
              child: const GaleryScreen(),
            ),
        '/detail': (_) => const DetailImage(),
      },
    );
  }
}

