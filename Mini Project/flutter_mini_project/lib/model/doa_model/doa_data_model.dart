// To parse this JSON data, do
//
//     final doaDataModel = doaDataModelFromJson(jsonString);

import 'dart:convert';

DoaDataModel doaDataModelFromJson(String str) => DoaDataModel.fromJson(json.decode(str));

String doaDataModelToJson(DoaDataModel data) => json.encode(data.toJson());

class DoaDataModel {
    List<Datum> data;

    DoaDataModel({
        required this.data,
    });

    factory DoaDataModel.fromJson(List<dynamic> json) {
    return DoaDataModel(
      data: List<Datum>.from(json.map((x) => Datum.fromJson(x))),
    );
  }

    Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String doa;
    String ayat;
    String latin;
    String artinya;

    Datum({
        required this.id,
        required this.doa,
        required this.ayat,
        required this.latin,
        required this.artinya,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        doa: json["doa"],
        ayat: json["ayat"],
        latin: json["latin"],
        artinya: json["artinya"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "doa": doa,
        "ayat": ayat,
        "latin": latin,
        "artinya": artinya,
    };
}
