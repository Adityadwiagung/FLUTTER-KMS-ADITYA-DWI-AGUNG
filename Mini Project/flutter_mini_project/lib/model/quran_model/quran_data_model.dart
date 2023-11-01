// To parse this JSON data, do
//
//     final quranDataModel = quranDataModelFromJson(jsonString);

import 'dart:convert';

QuranDataModel quranDataModelFromJson(String str) => QuranDataModel.fromJson(json.decode(str));

String quranDataModelToJson(QuranDataModel data) => json.encode(data.toJson());

class QuranDataModel {
  List<Result> results;

  QuranDataModel({
    required this.results,
  });

  factory QuranDataModel.fromJson(List<dynamic> json) {
    return QuranDataModel(
      results: List<Result>.from(json.map((x) => Result.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson()))
  };
  
}

class Result {
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  String tempatTurun;
  String arti;
  String deskripsi;
  String audio;

  Result({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audio,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    nomor: json["nomor"],
    nama: json["nama"],
    namaLatin: json["nama_latin"],
    jumlahAyat: json["jumlah_ayat"],
    tempatTurun: json["tempat_turun"],
    arti: json["arti"],
    deskripsi: json["deskripsi"],
    audio: json["audio"],
  );

  Map<String, dynamic> toJson() => {
    "nomor": nomor,
    "nama": nama,
    "nama_latin": namaLatin,
    "jumlah_ayat": jumlahAyat,
    "tempat_turun": tempatTurun,
    "arti": arti,
    "deskripsi": deskripsi,
    "audio": audio,
  };
}

