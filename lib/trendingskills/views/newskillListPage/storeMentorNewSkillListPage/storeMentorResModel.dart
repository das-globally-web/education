// To parse this JSON data, do
//
//     final storeMentorResModel = storeMentorResModelFromJson(jsonString);

import 'dart:convert';

StoreMentorResModel storeMentorResModelFromJson(String str) => StoreMentorResModel.fromJson(json.decode(str));

String storeMentorResModelToJson(StoreMentorResModel data) => json.encode(data.toJson());

class StoreMentorResModel {
    String message;
    Data data;

    StoreMentorResModel({
        required this.message,
        required this.data,
    });

    factory StoreMentorResModel.fromJson(Map<String, dynamic> json) => StoreMentorResModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    int userId;
    List<String> mentorIds;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        required this.id,
        required this.userId,
        required this.mentorIds,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        mentorIds: List<String>.from(json["mentor_ids"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "mentor_ids": List<dynamic>.from(mentorIds.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
