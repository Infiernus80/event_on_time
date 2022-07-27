// To parse this JSON data, do
//
//     final authEvent = authEventFromJson(jsonString);

import 'dart:convert';

AuthEvent authEventFromJson(String str) => AuthEvent.fromJson(json.decode(str));

String authEventToJson(AuthEvent data) => json.encode(data.toJson());

class AuthEvent {
    AuthEvent({
        required this.success,
        required this.msg,
        required this.result,
    });

    bool success;
    String msg;
    Result result;

    factory AuthEvent.fromJson(Map<String, dynamic> json) => AuthEvent(
        success: json["success"],
        msg: json["msg"],
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "result": result.toJson(),
    };
}

class Result {
    Result({
        required this.id,
        required this.name,
        required this.code,
        required this.description,
        required this.dateStart,
        required this.dateFinish,
        required this.googleMaps,
        required this.dressCode,
        required this.address,
        required this.services,
        required this.type,
        required this.status,
        required this.planner,
        required this.v,
        required this.pictures,
    });

    String id;
    String name;
    String code;
    String description;
    DateTime dateStart;
    DateTime dateFinish;
    String googleMaps;
    String dressCode;
    String address;
    List<Service> services;
    String type;
    bool status;
    String planner;
    int v;
    List<dynamic> pictures;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        name: json["name"],
        code: json["code"],
        description: json["description"],
        dateStart: DateTime.parse(json["dateStart"]),
        dateFinish: DateTime.parse(json["dateFinish"]),
        googleMaps: json["googleMaps"],
        dressCode: json["dressCode"],
        address: json["address"],
        services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
        type: json["type"],
        status: json["status"],
        planner: json["planner"],
        v: json["__v"],
        pictures: List<dynamic>.from(json["pictures"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "code": code,
        "description": description,
        "dateStart": dateStart.toIso8601String(),
        "dateFinish": dateFinish.toIso8601String(),
        "googleMaps": googleMaps,
        "dressCode": dressCode,
        "address": address,
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
        "type": type,
        "status": status,
        "planner": planner,
        "__v": v,
        "pictures": List<dynamic>.from(pictures.map((x) => x)),
    };
}

class Service {
    Service({
        required this.id,
        required this.name,
        required this.description,
    });

    String id;
    String name;
    String description;

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
    };
}
