// To parse this JSON data, do
//
//     final yourMentorModel = yourMentorModelFromJson(jsonString);

import 'dart:convert';

YourMentorModel yourMentorModelFromJson(String str) => YourMentorModel.fromJson(json.decode(str));

String yourMentorModelToJson(YourMentorModel data) => json.encode(data.toJson());

class YourMentorModel {
    String message;
    Data data;

    YourMentorModel({
        required this.message,
        required this.data,
    });

    factory YourMentorModel.fromJson(Map<String, dynamic> json) => YourMentorModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    User user;
    List<User> mentors;

    Data({
        required this.user,
        required this.mentors,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        mentors: List<User>.from(json["mentors"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "mentors": List<dynamic>.from(mentors.map((x) => x.toJson())),
    };
}

class User {
    int id;
    String fullName;
    String email;
    String userType;
    String profilePic;

    User({
        required this.id,
        required this.fullName,
        required this.email,
        required this.userType,
        required this.profilePic,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        userType: json["user_type"],
        profilePic: json["profile_pic"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "user_type": userType,
        "profile_pic": profilePic,
    };
}
