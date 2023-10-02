Summary:

Beberapa hal yang saya pelajari pada materi kali ini yaitu:

1. Provider digunakan untuk memisahkan antara logic dan Ui, selain agar terlihat lebih rapih, provider juga membuat aplikasi menjadi lebih ringan dikarenakan tidak lagi menggunakan Statefull Widget.

2. Contoh pembuatan class dari Provider yaitu:
import 'package:flutter/material.dart';

class FormPhoneChangeNotifier with ChangeNotifier{
    String _phoneValue = "";
    String? _messageErrorPhoneValue;
    final TextEditingController _phoneController = TextEditingController();

    String get phoneValue => _phoneValue;
    String? get messageErrorPhoneValue => _messageErrorPhoneValue;
    TextEditingController get phoneController => _phoneController;

    void phoneOnChanged(String value) {
      _phoneValue = value;
    if (_phoneValue.isEmpty){
      _messageErrorPhoneValue = "Nomor Tidak Boleh Kosong";
    }else if (!_phoneValue.startsWith("0")) {
      _messageErrorPhoneValue = "Nomor harus diawali dengan angka 0";
    }else if (_phoneValue.length <= 8 || _phoneValue.length >= 15) {
      _messageErrorPhoneValue = "Nomor minimal 8 digit dan maksimal 15 digit.";
    }else {
      _messageErrorPhoneValue = null;
    }
    notifyListeners();
  }
}

3. Provider kemudian harus di daftrakan di dalam runApp dengan multiProvider jika provider ada banyak seperti berikut:
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

4. Untuk menggunakan provider dapat disimpan kedalam sebuah variabel, contohnya sebagai berikut:
final formUsernameProvider = Provider.of<FormUsernameChangeNotifier>(context);