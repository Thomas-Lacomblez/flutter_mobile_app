import 'dart:convert';

import 'package:flutter_application_1/models/compte.dart';
import 'package:http/http.dart' as http;

Future<List<Compte>> fetchCompte() async {
  final response =
      await http.get(Uri.parse('http://localhost:9999/testmicroservice/comptes'));

  if (response.statusCode == 200) {

    return listCompteFromMap(response.body);
  } else {
    throw Exception('Failed to load album');
  }
}