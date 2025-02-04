// To parse this JSON data, do
//
//     final allMentorsModel = allMentorsModelFromJson(jsonString);

import 'dart:convert';

AllMentorsModel allMentorsModelFromJson(String str) => AllMentorsModel.fromJson(json.decode(str));

String allMentorsModelToJson(AllMentorsModel data) => json.encode(data.toJson());

class AllMentorsModel {
    String status;
    String message;
    List<Datum> data;

    AllMentorsModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory AllMentorsModel.fromJson(Map<String, dynamic> json) => AllMentorsModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    FullName fullName;
    String email;
    String phoneNumber;
    String? token;
    String? profilePic;
    UserType userType;
    List<ServiceType> serviceType;
    Description description;
    Location location;
    UserId userId;
    DateTime createdAt;
    DateTime updatedAt;
    int? skillsId;

    Datum({
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
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        fullName: fullNameValues.map[json["full_name"]]!,
        email: json["email"],
        phoneNumber: json["phone_number"],
        token: json["token"],
        profilePic: json["profile_pic"],
        userType: userTypeValues.map[json["user_type"]]!,
        serviceType: List<ServiceType>.from(json["service_type"].map((x) => serviceTypeValues.map[x]!)),
        description: descriptionValues.map[json["description"]]!,
        location: locationValues.map[json["location"]]!,
        userId: userIdValues.map[json["user_id"]]!,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        skillsId: json["skills_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullNameValues.reverse[fullName],
        "email": email,
        "phone_number": phoneNumber,
        "token": token,
        "profile_pic": profilePic,
        "user_type": userTypeValues.reverse[userType],
        "service_type": List<dynamic>.from(serviceType.map((x) => serviceTypeValues.reverse[x])),
        "description": descriptionValues.reverse[description],
        "location": locationValues.reverse[location],
        "user_id": userIdValues.reverse[userId],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "skills_id": skillsId,
    };
}

enum Description {
    HELLO_TEST
}

final descriptionValues = EnumValues({
    "hello test": Description.HELLO_TEST
});

enum FullName {
    FIROZ11_KHAN,
    FIROZ_KHAN,
    TEST
}

final fullNameValues = EnumValues({
    "firoz11 khan": FullName.FIROZ11_KHAN,
    "firoz khan": FullName.FIROZ_KHAN,
    "test": FullName.TEST
});

enum Location {
    JAIPUR,
    JAIPUT
}

final locationValues = EnumValues({
    "jaipur": Location.JAIPUR,
    "jaiput": Location.JAIPUT
});

enum ServiceType {
    HELLO,
    TEST,
    TEST1
}

final serviceTypeValues = EnumValues({
    "hello": ServiceType.HELLO,
    "test": ServiceType.TEST,
    "test1": ServiceType.TEST1
});

enum UserId {
    DDDD
}

final userIdValues = EnumValues({
    "dddd": UserId.DDDD
});

enum UserType {
    STUDENT
}

final userTypeValues = EnumValues({
    "student": UserType.STUDENT
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
