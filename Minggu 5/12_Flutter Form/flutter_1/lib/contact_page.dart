import 'package:flutter/material.dart';
import 'package:flutter_1/button_widget.dart';
import 'package:flutter_1/contact_model.dart';
import 'package:flutter_1/header_contact_page.dart';
import 'package:flutter_1/text_field_widget.dart';
import 'package:flutter_1/theme_color.dart';
import 'package:flutter_1/theme_text_style.dart';


class ContactPage extends StatefulWidget {

  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String _nameValue = "";
  String _phoneValue = "";

  String? messageErrorNameValue;
  String? messageErrorPhoneValue;

  List <ContactModel> contactModel = [];

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

  void phoneOnChanged(String value) {
    if (_phoneValue.isEmpty){
      messageErrorPhoneValue = "Nomor Tidak Boleh Kosong";
    }else if (!_phoneValue.startsWith("0")) {
      messageErrorPhoneValue = "Nomor harus diawali dengan angka 0";
    }else if (_phoneValue.length <= 8 || _phoneValue.length >= 15) {
      messageErrorPhoneValue = "Nomor minimal 8 digit dan maksimal 15 digit.";
    }else {
      messageErrorPhoneValue = null;
    }
    setState(() {});
  }



  void addContact() {
      contactModel.add(ContactModel(
        name: _nameValue, 
        phone: _phoneValue,
      ));
      resetField();
      setState(() {});
    }

  void removeContact(int index) {
    contactModel.removeAt(index);
    setState(() {});
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  int selectIndex  = -1;

  void updateContact(int index) {
    if(_nameValue.isNotEmpty && _phoneValue.isNotEmpty){
      contactModel[index] = ContactModel(
        name: _nameValue, 
        phone: _phoneValue,
      );
      index = -1;
      resetField();
      setState(() {});
    }
  }

  void resetField() {
    _nameController.clear();
    _phoneController.clear();
    _nameValue = "";
    _phoneValue = "";
    setState(() {});
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor().whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Contact',
          style: ThemeTextStyle().m3DisplayLarge,
          ) ,
          centerTitle: true,
      ),
      
      body: ListView(
        children: [
          const HeaderContactPage(),
          TextFieldWidget(
            
            label: 'Name',
            hintText: 'Insert Your Name',
            controller: _nameController,
            errorText: messageErrorNameValue,
            onChanged: (val) {
              _nameValue = val;
              nameOnChanged(_nameValue);
              setState(() {});
            },
          ),
          TextFieldWidget(
            label: 'Nomor',
            hintText: '+62....',
            textInputType: TextInputType.phone,
            controller: _phoneController,
            errorText: messageErrorPhoneValue,
            onChanged: (val) {
              _phoneValue = val;
              phoneOnChanged(_phoneValue);
              setState(() {});
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                  title: 'Submit',
                  onPressed: _nameValue.isNotEmpty  &&  _phoneValue.isNotEmpty
                  ? 
                  () {
                    if (selectIndex == -1) {
                      addContact();
                    } else{
                      updateContact(selectIndex);
                      selectIndex = -1;
                    }
                  } : null,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 49,
          ),
          Text(
            'List Contact',
            style: ThemeTextStyle().m3HeadlineSmall,
            textAlign: TextAlign.center,
          ),
          Container(
            width: double.infinity,
            height: 300,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: ThemeColor().m3SysLightPurple50,
              borderRadius: BorderRadius.circular(28)
            ),
            child: ListView.builder(
              shrinkWrap: true ,
              itemCount: contactModel.length,
              itemBuilder: (context, index) {
                var data = contactModel[index];
                return ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration:BoxDecoration(
                      color: ThemeColor().m3SysLightPurple90,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      data.name[0],
                      style: TextStyle(
                        color: ThemeColor().m3SysLightPurple40,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  title:  Text(data.name),
                  subtitle: Text(data.phone),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () {
                        _nameController.text = data.name;
                        _phoneController.text = data.phone;
                        selectIndex = index;
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.edit,
                      ),
                      ),
                      IconButton(onPressed: () {
                        removeContact(index);
                      },
                      icon: const Icon(
                        Icons.delete,
                      ),
                      ),
                    ],
                  ),
                );
              },
            ),   
        ),
        ]
      )
    );
  }
}