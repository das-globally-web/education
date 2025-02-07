// To parse this JSON data, do
//
//     final newSkillsModel = newSkillsModelFromJson(jsonString);

import 'dart:convert';

NewSkillsModel newSkillsModelFromJson(String str) => NewSkillsModel.fromJson(json.decode(str));

String newSkillsModelToJson(NewSkillsModel data) => json.encode(data.toJson());

class NewSkillsModel {
    String message;
    List<Datum> data;

    NewSkillsModel({
        required this.message,
        required this.data,
    });

    factory NewSkillsModel.fromJson(Map<String, dynamic> json) => NewSkillsModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String fullName;
    int id;
    String title;
    String subTitle;
    String image;
    String description;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
        required this.fullName,
        required this.id,
        required this.title,
        required this.subTitle,
        required this.image,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        fullName: json["full_name"],
        id: json["id"],
        title: json["title"],
        subTitle: json["sub_title"],
        image: json["image"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "id": id,
        "title": title,
        "sub_title": subTitle,
        "image": image,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
