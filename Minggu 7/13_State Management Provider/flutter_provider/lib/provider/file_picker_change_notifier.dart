import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerChangeNotifier with ChangeNotifier {
  FilePickerResult? _result;
  Future<FilePickerResult?>? _resultFile;

  FilePickerResult? get result => _result;
  Future<FilePickerResult?>? get resultFile => _resultFile;

  set result(FilePickerResult? value) {
    _result = value;
    notifyListeners();
  }

  Future<void> pickFile() async {
    _resultFile = FilePicker.platform.pickFiles();
    _result = await _resultFile;
    notifyListeners();
  }
  
}
