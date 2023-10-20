import 'package:flutter/material.dart';
import 'package:flutter_application_test/page/contact_page.dart';
import 'package:flutter_application_test/widget/button_widget.dart';
import 'package:flutter_application_test/widget/text_field_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormLoginPage extends StatefulWidget {
 const FormLoginPage({super.key});

  @override
  State<FormLoginPage> createState() => _FormLoginPageState();
}

class _FormLoginPageState extends State<FormLoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  late SharedPreferences _sharedPreferences;

  String _nameValue = "";
  String _passwordValue = "";

  String? messageErrorNameValue;
  String? messageErrorPasswordValue;

  void nameOnChanged(String value) {
    if (_nameValue.isEmpty){
      messageErrorNameValue = "Name Tidak Boleh Kosong";
    }else if (_nameValue.length <= 2) {
      messageErrorNameValue = "Name Harus Lebih Dari 2 Huruf";
    }else if (_nameValue[0] != _nameValue[0].toUpperCase()) {
      messageErrorNameValue = "Kata harus dimulai dengan huruf kapital";
    }else {
      messageErrorNameValue = null;
    }
    setState(() {});
  }

  void passwordOnChanged(String value) {
    if (_passwordValue.isEmpty){
      messageErrorPasswordValue = "Password Tidak Boleh Kosong";
    }else if (_passwordValue.length <= 8 || _passwordValue.length >= 15) {
      messageErrorPasswordValue = "Password minimal 8 digit dan maksimal 15 digit.";
    }else {
      messageErrorPasswordValue = null;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          TextFieldWidget(
            label: 'Username',
            hintText: 'Insert Your Username',
            controller: _usernameController,
            errorText: messageErrorNameValue,
            onChanged: (val) {
              _nameValue = val;
              nameOnChanged(_nameValue);
              setState(() {});
            },
          ),
          TextFieldWidget(
            label: 'Password',
            hintText: 'Insert Your Password',
            controller: _passwordController,
            errorText: messageErrorPasswordValue,
            onChanged: (val) {
              _passwordValue = val;
              passwordOnChanged(_passwordValue);
              setState(() {});
            },
          ),
          ButtonWidget(
            title: 'Save', 
            onPressed: _nameValue.isNotEmpty  &&  _passwordValue.isNotEmpty
            ? () async {
              _sharedPreferences = await SharedPreferences.getInstance();
              await _sharedPreferences.setString(
                'username', 
                _usernameController.text
              );

              await _sharedPreferences.setString(
                'password', 
                _passwordController.text
              );

              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(
                  builder: (context) => const ContactPage()
                ),
              );
            } : null
          )
        ],
      ),
    );
  }
}