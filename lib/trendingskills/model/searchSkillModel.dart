// To parse this JSON data, do
//
//     final searchSkillModel = searchSkillModelFromJson(jsonString);

import 'dart:convert';

SearchSkillModel searchSkillModelFromJson(String str) => SearchSkillModel.fromJson(json.decode(str));

String searchSkillModelToJson(SearchSkillModel data) => json.encode(data.toJson());

class SearchSkillModel {
    String message;
    List<Datum> data;

    SearchSkillModel({
        required this.message,
        required this.data,
    });

    factory SearchSkillModel.fromJson(Map<String, dynamic> json) => SearchSkillModel(
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
    String title;
    String subTitle;
    String? image;
    String description;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
        required this.id,
        required this.title,
        required this.subTitle,
        required this.image,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        subTitle: json["sub_title"],
        image: json["image"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "sub_title": subTitle,
        "image": image,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
