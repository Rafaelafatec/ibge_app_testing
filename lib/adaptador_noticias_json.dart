import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'noticias.dart';

List<Noticia> parseNoticias(String noticias) {
  final parsed = jsonDecode(noticias)['items'].cast<Map<String, dynamic>>();
  return parsed.map<Noticia>((json) => Noticia.fromJson(json)).toList();
}

Future<List<Noticia>> fetchNoticias(http.Client client) async {
  final response = await client.get(
      Uri.parse("http://servicodados.ibge.gov.br/api/v3/noticias/?qtd=10"));
  return compute(parseNoticias, response.body);
}
