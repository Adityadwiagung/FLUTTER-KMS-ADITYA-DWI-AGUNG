
import 'package:flutter_mini_project/model/quran_model/quran_lokal_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  String quranTabel = 'quranTabel';

  Future<Database> _initializeDb() async {
    var db = openDatabase(
      join(
        await getDatabasesPath(),
        'quran_db.db',
      ),
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $quranTabel(
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          nomor INTEGER,
          namaLatin TEXT,
          ayat TEXT
        )''');
      },
      version: 1,
    );

    return db;
  }

  Future<void> insertQuran(QuranLokalModel quranLokalModel) async {
    final db = await database;
    await db.insert(quranTabel, quranLokalModel.toMap());
  }

  Future<void> deleteQuran(int nomor) async {
    final db = await database;
    await db.delete(quranTabel, where: "nomor = ?", whereArgs: [nomor]);
  }

  Future<QuranLokalModel> getQuranById(int nomor) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      quranTabel,
      where: 'nomor = ?',
      whereArgs: [nomor],
    );


    if (result.isNotEmpty) {
      return result.map((e) => QuranLokalModel.fromMap(e)).toList().first;
    } else {
      return QuranLokalModel();
    }
    
  }

  Future<List<QuranLokalModel>> getListQuranLocal() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      quranTabel,
    );

    return result.map((e) => QuranLokalModel.fromMap(e)).toList();
  }

  Future<void> updateQuran(QuranLokalModel updatedQuran) async {
    final db = await database;
    await db.update(
      quranTabel,
      updatedQuran.toMap(),
      where: 'nomor = ?',
      whereArgs: [updatedQuran.nomor],
    );
}

}