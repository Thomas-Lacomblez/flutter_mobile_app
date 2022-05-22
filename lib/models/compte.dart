// To parse this JSON data, do
//
//     final compte = compteFromJson(jsonString);

import 'dart:convert';

List<Compte> listCompteFromMap(String str) => List<Compte>.from( json.decode(str).map( (x) => Compte.fromMap( x ) ) );

String listCompteToMap(List<Compte> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

Compte compteFromMap(String str) => Compte.fromMap(json.decode(str));

String compteToMap(Compte data) => json.encode(data.toMap());

class Compte {
    final int code;
    final double solde;
    final DateTime dateCreation;
    final String type;

    Compte({
        this.code = 0,
        required this.solde,
        required this.dateCreation,
        required this.type,
    });

    factory Compte.fromMap(Map<String, dynamic> json) => Compte(
        code: json["code"],
        solde: json["solde"],
        dateCreation: DateTime.parse(json["dateCreation"]),
        type: json["type"],
    );

    Map<String, dynamic> toMap() => {
        "code": code,
        "solde": solde,
        "dateCreation": dateCreation.toIso8601String(),
        "type": type,
    };
}
