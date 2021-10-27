import 'package:flutter/material.dart';

class Notificacoes extends StatefulWidget {
  const Notificacoes({ Key? key }) : super(key: key);

  @override
  State<Notificacoes> createState() => _NotificacoesState();
}

class _NotificacoesState extends State<Notificacoes> {
  List<bool> ativados = [false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: ListView(
        children: [
          SwitchListTile(
            title: const Text("Notificações padrão"),
            subtitle: const Text("Notificações gerais sobre várias categorias"),
            value: ativados[0], 
            onChanged: (bool value){setState(() => ativados[0] = value);}),
          SwitchListTile(
            title: const Text("Notificações personalizadas"),
            subtitle: const Text("Notificações customizadas"),
            value: ativados[1], 
            onChanged: (bool value){setState(() => ativados[1] = value);})
        ],
      )
    );
  }
}