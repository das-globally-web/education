// To parse this JSON data, do
//
//     final allUniModel = allUniModelFromJson(jsonString);

import 'dart:convert';

AllUniModel allUniModelFromJson(String str) => AllUniModel.fromJson(json.decode(str));

String allUniModelToJson(AllUniModel data) => json.encode(data.toJson());

class AllUniModel {
    String message;
    List<Datum> data;

    AllUniModel({
        required this.message,
        required this.data,
    });

    factory AllUniModel.fromJson(Map<String, dynamic> json) => AllUniModel(
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
    String city;
    String collageDescription;
    String branch;
    String seatIntake;
    String image;
    String? avgRating;
    int reviewCount;
    List<Review> reviews;

    Datum({
        required this.id,
        required this.collageName,
        required this.city,
        required this.collageDescription,
        required this.branch,
        required this.seatIntake,
        required this.image,
        required this.avgRating,
        required this.reviewCount,
        required this.reviews,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        collageName: json["collage_name"],
        city: json["city"],
        collageDescription: json["collage_description"],
        branch: json["branch"],
        seatIntake: json["seat_intake"],
        image: json["image"],
        avgRating: json["avg_rating"],
        reviewCount: json["review_count"],
        reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "collage_name": collageName,
        "city": city,
        "collage_description": collageDescription,
        "branch": branch,
        "seat_intake": seatIntake,
        "image": image,
        "avg_rating": avgRating,
        "review_count": reviewCount,
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
    };
}



class Review {
    int id;
    int count;

    Review({
        required this.id,
        required this.count,
    });

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "count": count,
    };
}

