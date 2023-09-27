Summary

3 Hal yang saya pelajari pada materi minggu ke 6 ini adalah:
1.  Asset merupakan File yang dibundled dan di depeloyed bersamaan dengan aplikasi. 
    Asset dapat berupa data static (JSON files), icons, images ataupun font (ttf).
    Penggunaan asset disimpan di dalam pubspec.yaml. contohnya sebagai berikut:
        assets:
          - assets/images/image1.jpg
    Contoh penggunaan asset gambar yaitu sebagai berikut:
    Image.asset('assets/image1.jpg'),

2.  Alert dialog merupakan suatu dialog yang muncul ketika terjadi interaksi.
    Berikut contoh penggunaan dari Alert Dialog:
        ElevatedButton(
            onPressed: () {
            Navigator.pop(context);
            showDialog(
                context: context, 
                barrierDismissible: false,
                builder: (context) {
                return AlertDialog(
                    title: const Text('Tekan Ya untuk Melihat Lihat Gambar',
                    ),
                    content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget> [
                        Image.asset(images[index])
                    ],
                    ),
                    actions: [
                    TextButton(onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(
                        context, 
                        '/detail',
                        arguments: Image.asset(images[index]),
                        );
                    }, child: const Text('Ya')),

                    TextButton(onPressed: () {
                        Navigator.pop(context);
                    }, child: const Text('Tidak')),
                    ],
                );
                }
            );
            }, 
            child: const Text("Lihat Gambar")).

    Bottom Sheet sama seperti dialog tetapi munculnya dari bawah keatas. Berikut contoh penggunaan Bottom Sheet:
        return GestureDetector(
            onTap: () {
                showModalBottomSheet(
                context: context,
                backgroundColor: const Color(0xFFEDDCC0),
                builder: (context) {
                    return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                        ClipOval(
                            child: Padding(
                            padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
                            child: Image.asset(images[index],
                            ),
                            ),
                        ), 

3.  Navigaiton merupakan perintah untuk berpindah dari suatu halaman ke halaman lain. Contoh dari penggunaan dari Navigation dasar yaitu adalah dengan menggunakan Navigator.push() untuk berpindah ke  halaman yang dituju dan Navigator.pop() untuk kembali ke halaman sebelumnya.
    Ada juga yang disebut Navigation dengan Named Route yaitu perpindahan halaman dengan menggunakan alamat yang disebut route. tiap halaman harus diinisialisasi dengan nama route sperti berikut :
    initialRoute: '/' = menentukan halaman pertama yang akan dibuka/
    routes: {
        '/': (_) => const HomeScreen(),
        '/galery': (_) => const GaleryScreen(),
    }.
    untuk menggunakannya sama saja seperti menggunakan Navigation dasar tetapi ditambah dengan menggunakan Named contohnya seperti berikut : Navigator.pushNamed()

    kita juga bisa mengirim data ke halaman baru dengan menggunakan parameter contohnya seperti berikut:
    Navigator.pushNamed(
        context, 
        '/detail',
        arguments: Image.asset(images[index]),
        );
    lalu ditampung dengan: 
    final parameter = ModalRoute.of(context)!.settings.arguments as Image;
    



