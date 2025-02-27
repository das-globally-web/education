// To parse this JSON data, do
//
//     final companyReviewModel = companyReviewModelFromJson(jsonString);

import 'dart:convert';

CompanyReviewModel companyReviewModelFromJson(String str) => CompanyReviewModel.fromJson(json.decode(str));

String companyReviewModelToJson(CompanyReviewModel data) => json.encode(data.toJson());

class CompanyReviewModel {
    String message;
    List<Datum> data;

    CompanyReviewModel({
        required this.message,
        required this.data,
    });

    factory CompanyReviewModel.fromJson(Map<String, dynamic> json) => CompanyReviewModel(
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
    String collageName;
    String collageDescription;
    dynamic image;
    String city;
    DateTime createdAt;
    DateTime updatedAt;
    String type;

    Datum({
        required this.id,
        required this.collageName,
        required this.collageDescription,
        required this.image,
        required this.city,
        required this.createdAt,
        required this.updatedAt,
        required this.type,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        collageName: json["collage_name"],
        collageDescription: json["collage_description"],
        image: json["image"],
        city: json["city"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "collage_name": collageName,
        "collage_description": collageDescription,
        "image": image,
        "city": city,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "type": type,
    };
}
