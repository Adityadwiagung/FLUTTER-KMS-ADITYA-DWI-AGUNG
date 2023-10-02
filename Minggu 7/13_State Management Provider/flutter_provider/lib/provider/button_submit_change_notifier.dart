import 'package:flutter/material.dart';
import 'package:flutter_provider/contact/contact_model.dart';

class ButtonSubmitChangeNotifier with ChangeNotifier{
  final List<ContactModel> _contactModel = [];
  List<ContactModel> get contactModel => _contactModel;
  int _selectIndex  = -1;
  int get selectIndex => _selectIndex;

  void addContact({
    required String name,
    required String phone,
    required DateTime dueDate,
    required Color currentColor,
    required String namaFile
  }) {
      contactModel.add(ContactModel(
        name: name, 
        phone: phone,
        tanggal: dueDate,
        warna: currentColor,
        namaFile: namaFile,
      )
      
    );
    notifyListeners();
  }

  void removeContact(int index) {
    contactModel.removeAt(index);
    notifyListeners();
  }
  

  void updateContact(int index, {
    required String name,
    required String phone,
    required DateTime dueDate,
    required Color currentColor,
    required String namaFile,
  }) {
    if (name.isNotEmpty && phone.isNotEmpty) {
      contactModel[index] = ContactModel(
        name: name,
        phone: phone,
        tanggal: dueDate,
        warna: currentColor,
        namaFile: namaFile,
      );
      index = -1;
      notifyListeners();
    }
  }

  void setSelectIndex(int newIndex) {
    _selectIndex = newIndex;
    notifyListeners();
  }
  


}