import 'package:flutter/material.dart';
import 'package:flutter_storage/page/contact_page.dart';
import 'package:flutter_storage/page/form_login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SharedPreferences _sharedPreferences;
  late String newUser;

  void checkLogin() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    newUser = _sharedPreferences.getString('username') ?? "";

    print(newUser);

    Future.delayed(
      const Duration
        (seconds: 1,
      ), () {
        if(newUser.isNotEmpty) {
        Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(
          builder: (context) => const ContactPage()
        ),
        (route) => false);
          print('sudah login');
        } 
        else {
      Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(
          builder: (context) => const FormLoginPage()
        ),
        (route) => false);
      }
    });
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.flutter_dash_outlined,
          size: 48,
          ),
      ),
    );
  }
}
