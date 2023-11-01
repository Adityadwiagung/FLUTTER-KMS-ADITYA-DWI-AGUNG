// To parse this JSON data, do
//
//     final hadistRangeModel = hadistRangeModelFromJson(jsonString);

import 'dart:convert';

HadistRangeModel hadistRangeModelFromJson(String str) => HadistRangeModel.fromJson(json.decode(str));

String hadistRangeModelToJson(HadistRangeModel data) => json.encode(data.toJson());

class HadistRangeModel {
    int code;
    String message;
    Data data;
    bool error;

    HadistRangeModel({
        required this.code,
        required this.message,
        required this.data,
        required this.error,
    });

    factory HadistRangeModel.fromJson(Map<String, dynamic> json) => HadistRangeModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
        "error": error,
    };
}

class Data {
    String name;
    String id;
    int available;
    int requested;
    List<Hadith> hadiths;

    Data({
        required this.name,
        required this.id,
        required this.available,
        required this.requested,
        required this.hadiths,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        id: json["id"],
        available: json["available"],
        requested: json["requested"],
        hadiths: List<Hadith>.from(json["hadiths"].map((x) => Hadith.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "available": available,
        "requested": requested,
        "hadiths": List<dynamic>.from(hadiths.map((x) => x.toJson())),
    };
}

class Hadith {
    int number;
    String arab;
    String id;

    Hadith({
        required this.number,
        required this.arab,
        required this.id,
    });

    factory Hadith.fromJson(Map<String, dynamic> json) => Hadith(
        number: json["number"],
        arab: json["arab"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "arab": arab,
        "id": id,
    };
}
