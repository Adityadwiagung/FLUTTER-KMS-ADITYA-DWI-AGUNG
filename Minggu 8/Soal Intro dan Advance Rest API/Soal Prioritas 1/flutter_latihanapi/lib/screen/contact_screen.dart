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

  bool isDataLoaded = false;

  List<ContactListResponse> _contactListResponse = [];
  String postMessage = '';


  Future<ContactListResponse?> getContact() async {
    final dio = Dio();
    final response = await dio.get('https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2');

    if (response.statusCode == 200) {
      final jsonMap = response.data;
      return ContactListResponse.fromJson(jsonMap);
    } else {
      throw Exception('Gagal mengambil data');
    }
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

  Future<void> Put() async {
    Dio dio = Dio();
    String url = 'https://jsonplaceholder.typicode.com/posts/1';
    Map<String, dynamic> requestBody = {
      'id': 1,
      'title': 'foo',
      'body': 'bar',
      'userId': 1,
    };

    try {
      Response response = await dio.put(url, data: requestBody);

      if (response.statusCode == 200) {

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('PUT request berhasil'),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Gagal melakukan PUT request. Status code: ${response.statusCode}'),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Terjadi error: $e'),
      ));
    }
  }


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
                  setState(() {
                    isDataLoaded = true;
                  });
                }, 
                child: const Text('GET')),
                ElevatedButton(onPressed: () {
                  postContact();
                }, 
                child: const Text('POST')),
                ElevatedButton(onPressed: () {
                  Put();
                }, 
                child: const Text('PUT'))
              ],
            ),
          Center(
              child: isDataLoaded
              ? FutureBuilder<ContactListResponse?>(
                future: getContact(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final contact = snapshot.data;
                    if (contact != null) {
                      return ListTile(
                        leading: Text('${contact.id}'),
                        title: Text('${contact.name}'),
                        subtitle: Text('${contact.phone}') ,
                      );
                    } else {
                      return Text('Data tidak tersedia');
                    }
                  } else {
                    return Text('Data tidak tersedia');
                  }
                },
              ) : SizedBox(),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _contactListResponse.length,
                itemBuilder: (context, index) {
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