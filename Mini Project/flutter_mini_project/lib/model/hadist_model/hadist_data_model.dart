// To parse this JSON data, do
//
//     final hadistDataModel = hadistDataModelFromJson(jsonString);

import 'dart:convert';

HadistDataModel hadistDataModelFromJson(String str) => HadistDataModel.fromJson(json.decode(str));

String hadistDataModelToJson(HadistDataModel data) => json.encode(data.toJson());

class HadistDataModel {
    int code;
    String message;
    List<Datum> data;
    bool error;

    HadistDataModel({
        required this.code,
        required this.message,
        required this.data,
        required this.error,
    });

    factory HadistDataModel.fromJson(Map<String, dynamic> json) => HadistDataModel(
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error,
    };
}

class Datum {
    String name;
    String id;
    int available;

    Datum({
        required this.name,
        required this.id,
        required this.available,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        id: json["id"],
        available: json["available"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "available": available,
    };
}
