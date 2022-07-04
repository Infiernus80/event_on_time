// To parse this JSON data, do
//
//     final scanModel = scanModelFromJson(jsonString);

import 'dart:convert';

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
    ScanModel({
        required this.id,
        required this.nombre,
        required this.acompanantes,
        required this.correo,
    });

    int id;
    String nombre;
    int acompanantes;
    String correo;

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        nombre: json["Nombre"],
        acompanantes: json["Acompañantes"],
        correo: json["Correo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "Nombre": nombre,
        "Acompañantes": acompanantes,
        "Correo": correo,
    };
}
