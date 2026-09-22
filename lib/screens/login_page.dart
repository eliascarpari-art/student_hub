import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_hub/components/menu_drawer.dart';
import 'package:student_hub/screens/home_page.dart';

import '../components/ElevateButtonComponent.dart';


class LoginPage extends StatefulWidget {



  @override


  State<LoginPage > createState() => _LoginPageState();

}
class _LoginPageState extends State<LoginPage > {


  // a chave do meu formulário - deve ser unica  - variavel final só recebe o valor em tempo de compilação
  final _formKey = GlobalKey<FormState>();

  //Controller para os campos de input do formulário
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Tela de login"),
        ),
        body: SingleChildScrollView(
            child:
            Container(
                margin: EdgeInsets.only(top: 150,left: 80,right: 80),
                child:  Column(
                    children: [
                      //formulário
                      Form(
                          key: _formKey,
                          child:Column(
                            children: [
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(labelText: 'Email'),
                                validator: (value){
                                  if(value == null || value.isEmpty)
                                  {
                                    return'Por favor, insira o email corretamente';
                                  }
                                  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                  if(!emailRegex.hasMatch(value)) {
                                    return 'Insira um e-mail válido';
                                  }
                                  return null;

                                },
                              ),
                              TextFormField(
                                controller: _senhaController,
                                decoration: InputDecoration(labelText: 'Senha'),
                                obscureText: true,
                                validator: (value){
                                  if(value == null || value.isEmpty || value.length < 6)
                                  {
                                    return'Por favor, insira uma senha válida com pelo menos 6 digitos';
                                  }
                                  return null;

                                },
                              ),

                              SizedBox(height: 20,),
                              ElevateButtonComponent(
                                  label: "Logar",
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ?? false){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => HomePage(nome: _emailController.text)),
                                    );
                                  }
                                    },
                                  cor: Colors.blue),
                              SizedBox(height: 20,),

                            ],
                          ) ),


                    ]
                )
            )


        )
    );
  }



}