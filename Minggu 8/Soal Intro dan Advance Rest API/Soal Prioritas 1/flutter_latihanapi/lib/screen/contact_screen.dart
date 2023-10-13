import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_latihanapi/model/contact_list_response.dart';

class ContactScreen extends StatefulWidget {
   ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  List<ContactListResponse> _contactListResponse = [];
  String postMessage = '';

  void getContact() {
  Dio()
      .get('https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts')
      .then((value) {
    List<dynamic> _contactData = value.data;

    for (var element in _contactData) {
      String id = element["id"].toString(); 
      String name = element["name"];
      String phone = element["phone"];

      _contactListResponse.add(ContactListResponse(
        id: id,
        name: name,
        phone: phone,
      ));
    }
    setState(() {});
  });
}

  void postContact() {
    String id = _idController.text.toString();
    String name = _nameController.text;
    String phone = _phoneController.text;

    if (id.isNotEmpty && name.isNotEmpty && phone.isNotEmpty) {
      Map<String, dynamic> data = {
        "id": id,
        "name": name,
        "phone": phone,
      };

      Dio()
        .post(
            'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
            data: data)
        .then((value) {
          _contactListResponse.add(ContactListResponse.fromJson(data));
          _idController.clear();
          _nameController.clear();
          _phoneController.clear();
          setState(() {});
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Data berhasil di post'),
        ));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Semua field harus diisi!'),
      ));
    }
  }

  // @override
  // void initState() {
  //   getContact();
  //   super.initState();
  // }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact API')
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(
                label: Text('Id')
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                label: Text('Nama')
              ),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                label: Text('Phone')
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: () {
                  _contactListResponse.clear();
                  getContact();
                }, 
                child: const Text('GET')),
                ElevatedButton(onPressed: () {
                  postContact();
                }, 
                child: const Text('POST')),
                ElevatedButton(onPressed: () {

                }, 
                child: const Text('PUT'))
              ],
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _contactListResponse.length,
                itemBuilder: (context, index) {
                  // return Text(_contactListResponse[index].name,);
                  return ListTile(
                    leading: Text(_contactListResponse[index].id.toString(),),
                    title: Text(_contactListResponse[index].name,),
                    subtitle: Text(_contactListResponse[index].phone,),
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}