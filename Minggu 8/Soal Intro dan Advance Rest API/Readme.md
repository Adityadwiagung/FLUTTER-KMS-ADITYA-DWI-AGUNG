Beberapa hal yang saya pelajari pada materi kali ini yaitu:
1. Kita dapat melakukan GET API untuk mendapatkan data dari API dengan cara berikut:
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

2. Lalu kita dapat melalakukan POST untuk menambah data dalam API dengan cara berikut:
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

  Pada kode tersebut data di POST dengan menggunakan data dari textfield controller

  3. Kita dapat melakukan PUT dengan cara berikut:
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