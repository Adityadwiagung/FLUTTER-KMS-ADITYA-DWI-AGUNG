Summary: 

Beberapa hal yang saya pelajari pada materi storage adalah:
1. Penyimpanan lokal dapat dilakukan dengan menggunakan Shared Preferences, tetapi data yang disimpan hanyalah data sederhana seperti teks, angka ataupun boolean. Kita juga dapat menyimpan data yang lebih besar dengan menggunakan Sqflite dan dapat melakukan CRUD disana.

2. Untuk dapat menggunakan local database, kita perlu mengimport sebuah package seperti shared_preferences dan juga sqflite.

3. Untuk dapat melakukan CRUD pada Sqflite kita harus membuat sebuah tabel database terlebih dahulu. berikut merupakan contoh pembuatan tabel dari sqflite:

 String dbTabel = 'dbTabel';  // menginisialisasi nama tabel

  Future<Database> _initializeDb() async {
    var db = openDatabase(
      join(
        await getDatabasesPath(),
        'tabel_db.db',
      ),
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $dbTabel( // membuat tabel dengan nama dbTabel
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, // membuat tiap colomn dari tabel. id sebagai primary key dan akan melakukan auto increment
          nomor INTEGER,
          contoh TEXT
        )''');
      },
      version: 1,
    );

    return db;
  }