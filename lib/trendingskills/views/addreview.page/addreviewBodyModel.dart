// To parse this JSON data, do
//
//     final addReviewBodyModel = addReviewBodyModelFromJson(jsonString);

import 'dart:convert';

AddReviewBodyModel addReviewBodyModelFromJson(String str) => AddReviewBodyModel.fromJson(json.decode(str));

String addReviewBodyModelToJson(AddReviewBodyModel data) => json.encode(data.toJson());

class AddReviewBodyModel {
    int userId;
    int count;
    String description;
    int collageId;
    int skillsId;

    AddReviewBodyModel({
        required this.userId,
        required this.count,
        required this.description,
        required this.collageId,
        required this.skillsId,
    });

    factory AddReviewBodyModel.fromJson(Map<String, dynamic> json) => AddReviewBodyModel(
        userId: json["user_id"],
        count: json["count"],
        description: json["description"],
        collageId: json["collage_id"],
        skillsId: json["skills_id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "count": count,
        "description": description,
        "collage_id": collageId,
        "skills_id": skillsId,
    };
}
