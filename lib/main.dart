import 'package:flutter/material.dart';
import 'package:ibge_app_testing/telanoticia.dart';
import 'package:ibge_app_testing/telanotificao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IBGEAPP',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(title: 'IBGE APP - Trabalho de Graduação'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
 
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  List<Widget> telas = <Widget>[
    const TelaNoticias(),
    const Notificacoes(),
  ];
  void _onItemChanged(value){
    setState(() {
      index = value;
    });    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: telas.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: _onItemChanged,
        selectedItemColor: Colors.deepOrange,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Tela principal"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Notificações"),
        ],),
    );
  }
}