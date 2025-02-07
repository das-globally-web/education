// To parse this JSON data, do
//
//     final addreviewResponseModel = addreviewResponseModelFromJson(jsonString);

import 'dart:convert';

AddreviewResponseModel addreviewResponseModelFromJson(String str) => AddreviewResponseModel.fromJson(json.decode(str));

String addreviewResponseModelToJson(AddreviewResponseModel data) => json.encode(data.toJson());

class AddreviewResponseModel {
    String message;
    Data data;

    AddreviewResponseModel({
        required this.message,
        required this.data,
    });

    factory AddreviewResponseModel.fromJson(Map<String, dynamic> json) => AddreviewResponseModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    String userId;
    String collageId;
    String count;
    String description;
    List<String> skillsId;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    Data({
        required this.userId,
        required this.collageId,
        required this.count,
        required this.description,
        required this.skillsId,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        collageId: json["collage_id"],
        count: json["count"],
        description: json["description"],
        skillsId: List<String>.from(json["skills_id"].map((x) => x)),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "collage_id": collageId,
        "count": count,
        "description": description,
        "skills_id": List<dynamic>.from(skillsId.map((x) => x)),
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
