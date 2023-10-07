1. Ada 3 konsep utama dari BloC yaitu:
State adalah representasi dari data saat ini dalam aplikasi Anda. Bisa berupa berbagai jenis data, seperti teks, daftar, angka, atau jenis data lainnya yang menggambarkan kondisi aplikasi pada suatu waktu.
Event adalah tindakan atau peristiwa yang memicu perubahan dalam BLoC. Event dapat berupa permintaan untuk melakukan tindakan tertentu, seperti memuat data, mengirim pesan, atau melakukan operasi lainnya.
BLoC adalah komponen yang mengelola logika bisnis dalam aplikasi Flutter. Ini adalah wadah untuk mengelola state aplikasi dan logika yang berkaitan.

2. Untuk menggunakan BloC kita harus mendaftarkannya dulu pada main seperti berikut:
runApp(
  BlocProvider(
    create: (context) => myBloc,
    child: MyApp(), // Gantilah dengan widget utama Anda
  ),
);

3. Untuk menggunakan BloC dapat dengan cara berikut:
BlocBuilder,
BlocProvider.of(context),
context.read atau context.watch dan
BlocListener
