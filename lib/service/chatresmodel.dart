// To parse this JSON data, do
//
//     final chatResponseModel = chatResponseModelFromJson(jsonString);

import 'dart:convert';

ChatResponseModel chatResponseModelFromJson(String str) => ChatResponseModel.fromJson(json.decode(str));

String chatResponseModelToJson(ChatResponseModel data) => json.encode(data.toJson());

class ChatResponseModel {
    List<Datum> data;
    bool status;

    ChatResponseModel({
        required this.data,
        required this.status,
    });

    factory ChatResponseModel.fromJson(Map<String, dynamic> json) => ChatResponseModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
    };
}

class Datum {
    String sender;
    String recipient;
    String message;
    DateTime timestamp;

    Datum({
        required this.sender,
        required this.recipient,
        required this.message,
        required this.timestamp,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        sender: json["sender"],
        recipient: json["recipient"],
        message: json["message"],
        timestamp: DateTime.parse(json["timestamp"]),
    );

    Map<String, dynamic> toJson() => {
        "sender": sender,
        "recipient": recipient,
        "message": message,
        "timestamp": timestamp.toIso8601String(),
    };
}
