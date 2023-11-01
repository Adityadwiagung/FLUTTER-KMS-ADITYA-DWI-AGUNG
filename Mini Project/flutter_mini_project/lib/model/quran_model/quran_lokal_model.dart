class QuranLokalModel {
    int? nomor;
    String? namaLatin;
    List<Ayat>? ayat;

    QuranLokalModel({
        this.nomor,
        this.namaLatin,
        this.ayat,
    });

    factory QuranLokalModel.fromMap(Map<String, dynamic> json) => QuranLokalModel(
        nomor: json["nomor"],
        namaLatin: json["namaLatin"],
        ayat: (json["ayat"] as List<dynamic>?)
            ?.map((x) => Ayat.fromMap(x))
            .toList(),
    );

    Map<String, dynamic> toMap() => {
        "nomor": nomor,
        "namaLatin": namaLatin,
        "ayat": ayat?.map((x) => x.toMap()).toList(),
    };
}

class Ayat {
    int id;

    Ayat({
        required this.id,
    });

    factory Ayat.fromMap(Map<String, dynamic> json) => Ayat(
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
    };
}
