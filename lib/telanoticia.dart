import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ibge_app_testing/adaptador_noticias_json.dart';
import 'noticias.dart';
import 'package:http/http.dart' as http;

class ListaNoticias extends StatelessWidget {
  const ListaNoticias({Key? key, required this.noticias}) : super(key: key);
  final List<Noticia> noticias;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
          itemCount: noticias.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: ListTile(
                onTap: (){},
                title: Text(noticias[index].titulo,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(
                  noticias[index].introducao,
                  textAlign: TextAlign.justify,
                ),
              ),
            );
          }),
    );
  }
}

class TelaNoticias extends StatelessWidget {
  const TelaNoticias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Noticia>>(
        future: fetchNoticias(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Error no fetch!"));
          } else if (snapshot.hasData) {
            return ListaNoticias(noticias: snapshot.data!);
          }
          else {
            return const Center(child: CircularProgressIndicator());
          }
        }
    
    );
  }
}

