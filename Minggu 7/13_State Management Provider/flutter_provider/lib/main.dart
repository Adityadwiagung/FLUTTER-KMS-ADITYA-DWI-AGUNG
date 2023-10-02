import 'package:flutter/material.dart';
import 'package:flutter_provider/galery/detail_image.dart';
import 'package:flutter_provider/galery/galery_page.dart';
import 'package:flutter_provider/provider/button_submit_change_notifier.dart';
import 'package:flutter_provider/provider/color_picker_change_notifier.dart';
import 'package:flutter_provider/provider/contact_provider/contact_provider_page.dart';
import 'package:flutter_provider/provider/date_picker_change_notifier.dart';
import 'package:flutter_provider/provider/file_picker_change_notifier.dart';
import 'package:flutter_provider/provider/form_phone_change_notifier.dart';
import 'package:flutter_provider/provider/form_username_change_notifier.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FormUsernameChangeNotifier()
          ),
        ChangeNotifierProvider(
          create: (_) => FormPhoneChangeNotifier()
          ),
        ChangeNotifierProvider(
          create: (_) => DatePickerChangeNotifier()
          ),
        ChangeNotifierProvider(
          create: (_) => ColorPickerChangeNotifier()
          ),
        ChangeNotifierProvider(
          create: (_) => FilePickerChangeNotifier()
          ),
        ChangeNotifierProvider(
          create: (_) => ButtonSubmitChangeNotifier()
          ),
      ],
      child: const MyApp(),
      ),
  );
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
      initialRoute: '/contactProvider',
      routes: {
        '/': (_) => const MyGalery(),
        '/detail': (_) => const DetailImage(),
        '/contactProvider': (_) => const ContactProviderPage(),
      },
    );
  }
}


