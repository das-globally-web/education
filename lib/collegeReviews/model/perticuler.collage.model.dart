// To parse this JSON data, do
//
//     final perticulerCollageModel = perticulerCollageModelFromJson(jsonString);

import 'dart:convert';

PerticulerCollageModel perticulerCollageModelFromJson(String str) => PerticulerCollageModel.fromJson(json.decode(str));

String perticulerCollageModelToJson(PerticulerCollageModel data) => json.encode(data.toJson());

class PerticulerCollageModel {
    String message;
    Data data;

    PerticulerCollageModel({
        required this.message,
        required this.data,
    });

    factory PerticulerCollageModel.fromJson(Map<String, dynamic> json) => PerticulerCollageModel(
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
    String collageName;
    String collageDescription;
    String image;
    String city;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic avgRating;
    int reviewCount;
    // String? branch;
    // String seat_intake;
    

    Data({
        required this.id,
        required this.collageName,
        required this.collageDescription,
        required this.image,
        required this.city,
        required this.createdAt,
        required this.updatedAt,
        required this.avgRating,
        required this.reviewCount,
        // required this.branch,
        // required this.seat_intake,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        collageName: json["collage_name"],
        collageDescription: json["collage_description"],
        image: json["image"],
        city: json["city"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        avgRating: json["avg_rating"],
        reviewCount: json["review_count"],
        // branch: json['branch'],
        // seat_intake: json['seat_intake'],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "collage_name": collageName,
        "collage_description": collageDescription,
        "image": image,
        "city": city,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "avg_rating": avgRating,
        "review_count": reviewCount,
        // "branch": branch,
        // "seat_intake": seat_intake,
    };
}
