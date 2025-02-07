// To parse this JSON data, do
//
//     final addreviewBodyModel = addreviewBodyModelFromJson(jsonString);

import 'dart:convert';

AddreviewBodyModel addreviewBodyModelFromJson(String str) => AddreviewBodyModel.fromJson(json.decode(str));

String addreviewBodyModelToJson(AddreviewBodyModel data) => json.encode(data.toJson());

class AddreviewBodyModel {
    int userId;
    int count;
    String description;
    int collegeId;
    int skillsId;

    AddreviewBodyModel({
        required this.userId,
        required this.count,
        required this.description,
        required this.collegeId,
        required this.skillsId,
    });

    factory AddreviewBodyModel.fromJson(Map<String, dynamic> json) => AddreviewBodyModel(
        userId: json["user_id"],
        count: json["count"],
        description: json["description"],
        collegeId: json["college_id"],
        skillsId: json["skills_id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "count": count,
        "description": description,
        "college_id": collegeId,
        "skills_id": skillsId,
    };
}
