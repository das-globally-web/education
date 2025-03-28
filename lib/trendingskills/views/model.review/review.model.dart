// To parse this JSON data, do
//
//     final addReviewModel = addReviewModelFromJson(jsonString);

import 'dart:convert';

AddReviewModel addReviewModelFromJson(String str) => AddReviewModel.fromJson(json.decode(str));

String addReviewModelToJson(AddReviewModel data) => json.encode(data.toJson());

class AddReviewModel {
    String message;
    List<Datum> data;

    AddReviewModel({
        required this.message,
        required this.data,
    });

    factory AddReviewModel.fromJson(Map<String, dynamic> json) => AddReviewModel(
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
    String userName;
    int collageId;
    String collageName;
    String collageDescription;
    String collageCity;
    String collageImage;
    int count;
    String description;
    DateTime createdAt;
    DateTime updatedAt;
    List<Skill> skills;

    Datum({
        required this.id,
        required this.userName,
        required this.collageId,
        required this.collageName,
        required this.collageDescription,
        required this.collageCity,
        required this.collageImage,
        required this.count,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
        required this.skills,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userName: json["user_name"],
        collageId: json["collage_id"],
        collageName: json["collage_name"],
        collageDescription: json["collage_description"],
        collageCity: json["collage_city"],
        collageImage: json["collage_image"],
        count: json["count"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "collage_id": collageId,
        "collage_name": collageName,
        "collage_description": collageDescription,
        "collage_city": collageCity,
        "collage_image": collageImage,
        "count": count,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
    };
}

class Skill {
    int id;
    String name;

    Skill({
        required this.id,
        required this.name,
    });

    factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
