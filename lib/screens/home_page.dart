
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/menu_drawer.dart';

class HomePage extends StatefulWidget {

  final String nome;

  const HomePage({super.key, required this.nome});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(  appBar: AppBar(
      backgroundColor: Colors.blueAccent,
      title: Text("Bem vindo:${widget.nome} "),
    ),
        drawer: MenuDrawer(),
        body: SingleChildScrollView(
            child:
            Container(
                margin: EdgeInsets.all(20),
                child:  Column(
                    children: [



                    ]
                )
            )


        )


    );
  }
}