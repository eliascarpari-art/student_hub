import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_hub/screens/calculator_page.dart';
import 'package:student_hub/screens/home_page.dart';
import '../screens/courses_page.dart';
import '../screens/login_page.dart';
import '../screens/register_page.dart';


class MenuDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Tela inicial"),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage(nome: "Anonimo")));

            },
          ),
          ListTile(
            title: Text("Calculadora"),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) =>  CalculatorPage()));

            },
          ),
          ListTile(
            title: Text("Cadastro de aluno"),
            onTap: (){

              Navigator.push(context,MaterialPageRoute(builder: (context) =>  RegisterPage()));
            },
          ),
          ListTile(
            title: Text("Tela de Cursos"),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => CoursesPage()));
            },
          ),
          ListTile(
            title: Text("Sair"),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),


        ],
      ),
    );
  }

}

