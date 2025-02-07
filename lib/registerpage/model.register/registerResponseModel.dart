// To parse this JSON data, do
//
//     final registerResponseModel = registerResponseModelFromJson(jsonString);

import 'dart:convert';

RegisterResponseModel registerResponseModelFromJson(String str) => RegisterResponseModel.fromJson(json.decode(str));

String registerResponseModelToJson(RegisterResponseModel data) => json.encode(data.toJson());

class RegisterResponseModel {
    String message;
    Data data;

    RegisterResponseModel({
        required this.message,
        required this.data,
    });

    factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => RegisterResponseModel(
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
    String fullName;
    String email;
    String phoneNumber;
    List<String> serviceType;
    String userType;
    String description;
    String location;
    dynamic profilePic;
    String skillsId;
    DateTime updatedAt;
    DateTime createdAt;
    int id;
    String token;

    Data({
        required this.userId,
        required this.fullName,
        required this.email,
        required this.phoneNumber,
        required this.serviceType,
        required this.userType,
        required this.description,
        required this.location,
        required this.profilePic,
        required this.skillsId,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
        required this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        fullName: json["full_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        serviceType: List<String>.from(json["service_type"].map((x) => x)),
        userType: json["user_type"],
        description: json["description"],
        location: json["location"],
        profilePic: json["profile_pic"],
        skillsId: json["skills_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "full_name": fullName,
        "email": email,
        "phone_number": phoneNumber,
        "service_type": List<dynamic>.from(serviceType.map((x) => x)),
        "user_type": userType,
        "description": description,
        "location": location,
        "profile_pic": profilePic,
        "skills_id": skillsId,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
        "token": token,
    };
}
