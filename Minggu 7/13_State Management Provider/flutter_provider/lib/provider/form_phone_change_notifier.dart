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