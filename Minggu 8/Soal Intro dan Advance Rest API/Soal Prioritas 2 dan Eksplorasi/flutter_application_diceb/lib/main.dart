import 'package:flutter/material.dart';
import 'package:flutter_application_diceb/model/dice_bear_model.dart';
import 'package:flutter_application_diceb/screen/image_gen_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DiceBearModel>(
          create: (context) => DiceBearModel(),
        )
      ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ImageGenScreen()
      ),
    );
  }
}

