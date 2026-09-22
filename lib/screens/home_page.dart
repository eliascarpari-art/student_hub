
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_hub/screens/calculator_page.dart';
import 'package:student_hub/screens/register_page.dart';
import '../components/menu_drawer.dart';
import 'courses_page.dart';

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
      title: Text("Bem vindo ao student hub "),
    ),
        drawer: MenuDrawer(),
        body: SingleChildScrollView(
            child:
            Container(
                margin: EdgeInsets.all(20),
                child:  Column(
                  children: [

                    Card(
                      child: ListTile(
                        title: Text("Cursos"),
                        subtitle: Text("Veja os cursos disponíveis"),
                        leading: Icon(Icons.school),
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => CoursesPage()));

                        },
                      ),
                    ),

                    Card(
                      child: ListTile(
                        title: Text("Calculadora"),
                        subtitle: Text("Faça seus cálculos"),
                        leading: Icon(Icons.calculate),
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => CalculatorPage()));

                        },
                      ),
                    ),

                    Card(
                      child: ListTile(
                        title: Text("Cadastrar Aluno"),
                        subtitle: Text("Cadastre um novo aluno"),
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => RegisterPage()));

                        },
                        leading: Icon(Icons.person_add),
                      ),
                    ),

                  ],
                )
            )


        )


    );
  }
}