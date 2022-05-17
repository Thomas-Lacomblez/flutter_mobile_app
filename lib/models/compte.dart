import 'dart:convert';
import 'dart:ffi';

class Compte {
  final int id;
  final double solde;
  final DateTime dateCreation;
  final String type;


List<Compte> postFromJson(String str) =>
    List<Compte>.from(json.decode(str).map((x) => Compte.fromMap(x)));

  const Compte({
    this.id = 0,
    required this.solde,
    required this.dateCreation,
    required this.type,
    
  });

  factory Compte.fromJson(Map<String, dynamic> json) {
    return Compte(
      id: json['id'],
      solde: json['solde'],
      dateCreation: json['dateCreation'],
      type: json['type'],
      
    );
  }

    factory Compte.fromMap(Map<String, dynamic> json) => Compte(
        id: json['code'],
        solde: json['solde'],
        dateCreation: DateTime.parse(json['dateCreation'].toString() ),
        type: json['type'],
      );
}