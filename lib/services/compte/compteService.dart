import 'dart:convert';

import 'package:flutter_application_1/models/compte.dart';
import 'package:http/http.dart' as http;

Future<List<Compte>> fetchCompte() async {
  final response =
      await http.get(Uri.parse('http://192.168.1.20:9999/testmicroservice/comptes'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Compte>((json) => Compte.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}