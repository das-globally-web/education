// To parse this JSON data, do
//
//     final uSerProfieModel = uSerProfieModelFromJson(jsonString);

import 'dart:convert';

USerProfieModel uSerProfieModelFromJson(String str) => USerProfieModel.fromJson(json.decode(str));

String uSerProfieModelToJson(USerProfieModel data) => json.encode(data.toJson());

class USerProfieModel {
    String message;
    Data data;

    USerProfieModel({
        required this.message,
        required this.data,
    });

    factory USerProfieModel.fromJson(Map<String, dynamic> json) => USerProfieModel(
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
    String fullName;
    String email;
    String phoneNumber;
    dynamic token;
    String profilePic;
    String userType;
    List<String> serviceType;
    String description;
    dynamic location;
    String userId;
    DateTime createdAt;
    DateTime updatedAt;
    int skillsId;
    dynamic totalExperience;
    dynamic usersField;
    dynamic languageKnown;
    dynamic linkedinUser;
    dynamic dob;
    dynamic gender;
    dynamic resumeUpload;

    Data({
        required this.id,
        required this.fullName,
        required this.email,
        required this.phoneNumber,
        required this.token,
        required this.profilePic,
        required this.userType,
        required this.serviceType,
        required this.description,
        required this.location,
        required this.userId,
        required this.createdAt,
        required this.updatedAt,
        required this.skillsId,
        required this.totalExperience,
        required this.usersField,
        required this.languageKnown,
        required this.linkedinUser,
        required this.dob,
        required this.gender,
        required this.resumeUpload,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        token: json["token"],
        profilePic: json["profile_pic"],
        userType: json["user_type"],
        serviceType: List<String>.from(json["service_type"].map((x) => x)),
        description: json["description"],
        location: json["location"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        skillsId: json["skills_id"],
        totalExperience: json["total_experience"],
        usersField: json["users_field"],
        languageKnown: json["language_known"],
        linkedinUser: json["linkedin_user"],
        dob: json["dob"],
        gender: json["gender"],
        resumeUpload: json["resume_upload"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "phone_number": phoneNumber,
        "token": token,
        "profile_pic": profilePic,
        "user_type": userType,
        "service_type": List<dynamic>.from(serviceType.map((x) => x)),
        "description": description,
        "location": location,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "skills_id": skillsId,
        "total_experience": totalExperience,
        "users_field": usersField,
        "language_known": languageKnown,
        "linkedin_user": linkedinUser,
        "dob": dob,
        "gender": gender,
        "resume_upload": resumeUpload,
    };
}
