// To parse this JSON data, do
//
//     final storeMentorBodyModel = storeMentorBodyModelFromJson(jsonString);

import 'dart:convert';

StoreMentorBodyModel storeMentorBodyModelFromJson(String str) => StoreMentorBodyModel.fromJson(json.decode(str));

String storeMentorBodyModelToJson(StoreMentorBodyModel data) => json.encode(data.toJson());

class StoreMentorBodyModel {
    int userId;
    String mentorIds;

    StoreMentorBodyModel({
        required this.userId,
        required this.mentorIds,
    });

    factory StoreMentorBodyModel.fromJson(Map<String, dynamic> json) => StoreMentorBodyModel(
        userId: json["user_id"],
        mentorIds: json["mentor_ids"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "mentor_ids": mentorIds,
    };
}
