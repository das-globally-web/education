// To parse this JSON data, do
//
//     final searchCollageModel = searchCollageModelFromJson(jsonString);

import 'dart:convert';

SearchCollageModel searchCollageModelFromJson(String str) => SearchCollageModel.fromJson(json.decode(str));

String searchCollageModelToJson(SearchCollageModel data) => json.encode(data.toJson());

class SearchCollageModel {
    String message;
    List<Datum> data;

    SearchCollageModel({
        required this.message,
        required this.data,
    });

    factory SearchCollageModel.fromJson(Map<String, dynamic> json) => SearchCollageModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    Collage collageName;
    Collage collageDescription;
    String? image;
    City city;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
        required this.id,
        required this.collageName,
        required this.collageDescription,
        required this.image,
        required this.city,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        collageName: collageValues.map[json["collage_name"]]!,
        collageDescription: collageValues.map[json["collage_description"]]!,
        image: json["image"],
        city: cityValues.map[json["city"]]!,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "collage_name": collageValues.reverse[collageName],
        "collage_description": collageValues.reverse[collageDescription],
        "image": image,
        "city": cityValues.reverse[city],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

enum City {
    JAIPUR
}

final cityValues = EnumValues({
    "jaipur": City.JAIPUR
});

enum Collage {
    MDSU
}

final collageValues = EnumValues({
    "mdsu": Collage.MDSU
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
