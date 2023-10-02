import 'package:flutter/widgets.dart';

class FormUsernameChangeNotifier with ChangeNotifier {
  String _nameValue = "";
  String? _messageErrorNameValue;
  final TextEditingController _nameController = TextEditingController();

  String get nameValue => _nameValue;
  String? get messageErrorNameValue => _messageErrorNameValue;
  TextEditingController get nameController => _nameController;

  void nameOnChanged(String value) {
    _nameValue = value;
    if (_nameValue.isEmpty){
      _messageErrorNameValue = "Name Tidak Boleh Kosong";
    }else if (_nameValue.length <= 2) {
      _messageErrorNameValue = "Name Harus Lebih Dari 2 Huruf";
    }else if (_nameValue[0] != _nameValue[0].toUpperCase()) {
      _messageErrorNameValue = "Kata harus dimulai dengan huruf kapital";
    }else {
      _messageErrorNameValue = null;
    }
    notifyListeners();
  }

}