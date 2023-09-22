import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/button_widget.dart';
import 'package:flutter_application_2/contact_model.dart';
import 'package:flutter_application_2/header_contact_page.dart';
import 'package:flutter_application_2/text_field_widget.dart';
import 'package:flutter_application_2/theme_color.dart';
import 'package:flutter_application_2/theme_text_style.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';


class ContactPage extends StatefulWidget {

  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  FilePickerResult? result;
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = Colors.orange;


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
        tanggal: _dueDate,
        warna: _currentColor,
        namaFile: result?.files.first.name,
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
        tanggal: _dueDate,
        warna: _currentColor,
        namaFile: result?.files.first.name,

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
    _dueDate = DateTime.now();
    _currentColor = Colors.orange;
    result = null;
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
              padding: const EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 16),
              child: Column(
                children: [
                  buildDatePicker(context),
                  const SizedBox(height: 20),
                  buildColorPicker(context),
                  const SizedBox(height: 20),
                  buildFilePicker(context),
                ],
              )
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
                      IconButton(onPressed: () {
                        showDialog(
                          context: context, 
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Information'),
                              content: (
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Date: ' + DateFormat('dd-MM-yyyy').format(data.tanggal),
                                    ),
                                    Row(
                                        children: [
                                          Text(
                                            'Warna: ' + colorToHex(data.warna),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(width: 8), 
                                          Container(
                                            width: 20, 
                                            height: 20, 
                                            color: data.warna, 
                                          ),
                                          
                                        ],
                                      ),
                                    Text(
                                      'File: ' + (data.namaFile?? '-'),
                                    ),
                                  ],
                                )
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }, 
                                  child: const Text('Close')
                                  )
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.info,
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

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
            onPressed:() async{
              final selectDate = await showDatePicker(
              context: context, 
              initialDate: currentDate, 
              firstDate: DateTime(1990), 
              lastDate: DateTime(currentDate.year + 5)
              );

              setState(() {
                if (selectDate != null) {
                  _dueDate = selectDate;
                  
                }

              });
            },
            child: const Text('Select'),
            )
          ],
          ),
        Text(
          DateFormat('dd-MM-yyyy').format(_dueDate),
        ),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color'),
        const SizedBox(height: 10,),
        Container(
          height: 100, 
          width: double.infinity,
          
          decoration: BoxDecoration(
            color: _currentColor,
            borderRadius: BorderRadius.circular(20)
          ),
          ),
          const SizedBox(height: 10,),
          Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context, 
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Pick Your Color'),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: _currentColor,
                          onColorChanged: (color) {
                          setState(() {
                            _currentColor = color;
                          });
                        },
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          }, 
                          child: const Text('Save')
                          )
                      ],
                    );
                  },
                );
              }, 
              child: const Text(
                'Pick Color',
              ),
              ),
          ),
      ],
    );
  }

  Widget buildFilePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Pick File'),
        SizedBox(height: 10,),
        Center(
          child: ElevatedButton(
            onPressed: () async {
              final resultFile = await FilePicker.platform.pickFiles();
              if(resultFile != null) {
                result = resultFile;
              }
              else{
                result = null;
              }
              setState(() {});
            }, 
            child: 
            const Text('Pick File'),
            ),
        ),
        SizedBox(height: 10,),
        Center(child: Text(result?.files.first.name ?? '-')),
      ],
    );
  }

}