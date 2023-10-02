import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_provider/contact/header_contact_page.dart';
import 'package:flutter_provider/provider/button_submit_change_notifier.dart';
import 'package:flutter_provider/provider/color_picker_change_notifier.dart';
import 'package:flutter_provider/provider/date_picker_change_notifier.dart';
import 'package:flutter_provider/provider/file_picker_change_notifier.dart';
import 'package:flutter_provider/provider/form_phone_change_notifier.dart';
import 'package:flutter_provider/provider/form_username_change_notifier.dart';
import 'package:flutter_provider/theme/theme_color.dart';
import 'package:flutter_provider/theme/theme_text_style.dart';
import 'package:flutter_provider/widget/button_widget.dart';
import 'package:flutter_provider/widget/color_picker_widget.dart';
import 'package:flutter_provider/widget/date_picker_widget.dart';
import 'package:flutter_provider/widget/file_picker.dart';
import 'package:flutter_provider/widget/text_field_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class ContactProviderPage extends StatelessWidget {
  const ContactProviderPage({super.key});

  

  @override
  Widget build(BuildContext context) {
    final formUsernameProvider = Provider.of<FormUsernameChangeNotifier>(context);
    final formPhoneProvider = Provider.of<FormPhoneChangeNotifier>(context);
    final colorPickerProvider = Provider.of<ColorPickerChangeNotifier>(context);
    final datePickerProvider = Provider.of<DatePickerChangeNotifier>(context);
    final filePickerProvider = Provider.of<FilePickerChangeNotifier>(context);
    final buttonSubmitProvider = Provider.of<ButtonSubmitChangeNotifier>(context);


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
      drawer: Drawer(
        child: ListView(
          children: [
             DrawerHeader(
              decoration: BoxDecoration(
                color: ThemeColor().m3SysLightPurple90,
              ),
              child: const Text('Navigation'),
            ),
            ListTile(
              title: const Text('Contact Page'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Galery Page'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context, 
                  '/',
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          const HeaderContactPage(),
          TextFieldWidget(
            
            label: 'Name',
            hintText: 'Insert Your Name',
            controller: formUsernameProvider.nameController,
            errorText: formUsernameProvider.messageErrorNameValue,
            onChanged: (val) {
              formUsernameProvider.nameOnChanged(val);
            },
          ),
          TextFieldWidget(
            label: 'Nomor',
            hintText: '+62....',
            textInputType: TextInputType.phone,
            controller: formPhoneProvider.phoneController,
            errorText: formPhoneProvider.messageErrorPhoneValue,
            onChanged: (val) {
              formPhoneProvider.phoneOnChanged(val);
            },
          ),
          Padding(
              padding: const EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 16),
              child: Column(
                children: [
                  DatePickerWidget(context),
                  const SizedBox(height: 20),
                  ColorPickerWidget(context),
                  const SizedBox(height: 20),
                  FilePickerWidget(context),
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
                  onPressed: formUsernameProvider.nameValue.isNotEmpty  &&  formPhoneProvider.phoneValue.isNotEmpty
                  ? 
                  () {
                    if (buttonSubmitProvider.selectIndex == -1){
                      buttonSubmitProvider.addContact(
                      name: formUsernameProvider.nameValue, 
                      phone: formPhoneProvider.phoneValue, 
                      dueDate: datePickerProvider.dueDate, 
                      currentColor: colorPickerProvider.currentColor, 
                      namaFile: filePickerProvider.result?.files.first.name ?? '-',
                      );
                      formUsernameProvider.nameController.clear();
                      formPhoneProvider.phoneController.clear();
                      colorPickerProvider.currentColor = Colors.orange;
                      datePickerProvider.dueDate = DateTime.now();
                      filePickerProvider.result = null;
                    } else {
                      buttonSubmitProvider.updateContact(
                        buttonSubmitProvider.selectIndex,
                        name: formUsernameProvider.nameValue, 
                        phone: formPhoneProvider.phoneValue, 
                        dueDate: datePickerProvider.dueDate, 
                        currentColor: colorPickerProvider.currentColor, 
                        namaFile: filePickerProvider.result?.files.first.name ?? '-',
                      );
                      buttonSubmitProvider.setSelectIndex(-1);
                      formUsernameProvider.nameController.clear();
                      formPhoneProvider.phoneController.clear();
                      colorPickerProvider.currentColor = Colors.orange;
                      datePickerProvider.dueDate = DateTime.now();
                      filePickerProvider.result = null;
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
              itemCount: buttonSubmitProvider.contactModel.length,
              itemBuilder: (context, index) {
                var data = buttonSubmitProvider.contactModel[index];
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
                        formUsernameProvider.nameController.text = data.name;
                        formPhoneProvider.phoneController.text = data.phone;
                        buttonSubmitProvider.setSelectIndex(index);
                      },
                      icon: const Icon(
                        Icons.edit,
                      ),
                      ),
                      IconButton(onPressed: () {
                        buttonSubmitProvider.removeContact(index);
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
                                      'Date: ${DateFormat('dd-MM-yyyy').format(data.tanggal)}',
                                    ),
                                    Row(
                                        children: [
                                          Text(
                                            'Warna: ${colorToHex(data.warna)}',
                                            textAlign: TextAlign.left,
                                          ),
                                          const SizedBox(width: 8), 
                                          Container(
                                            width: 20, 
                                            height: 20, 
                                            color: data.warna, 
                                          ),
                                          
                                        ],
                                      ),
                                    Text(
                                      'File: ${data.namaFile?? '-'}',
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
        )
        ]
      )
    );
  }
  
}