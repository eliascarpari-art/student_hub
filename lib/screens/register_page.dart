import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/ElevateButtonComponent.dart';
import '../components/menu_drawer.dart';


class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  //Controller para os campos de input do formulário
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _cursoController = TextEditingController();


  String _jsonOutput = '';
  //função convert para JSON

  void _gerarJson(){
    if(_formKey.currentState?.validate() ?? false)
    {
      final Map<String, dynamic> data = {
        'nome':_nomeController.text,
        'email':_emailController.text,
        'idade':_idadeController.text,
        'curso':_cursoController.text

      };setState(() {
        _jsonOutput = jsonEncode(data);
      });
    };
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Pagina de Cadastro"),
        ),
        drawer: MenuDrawer(),
        body: SingleChildScrollView(
            child:
            Container(
                margin: EdgeInsets.all(20),
                child:  Column(
                    children: [
                      //formulário
                      Form(
                          key: _formKey,
                          child:Column(
                            children: [
                              TextFormField(
                                controller: _nomeController,
                                decoration: InputDecoration(labelText: 'Nome'),
                                validator: (value){
                                  if(value == null || value.isEmpty)
                                  {
                                    return'Por favor, insira um nome:';
                                  }
                                  return null;

                                },
                              ),
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(labelText: 'Email'),
                                validator: (value){
                                  if(value == null || value.isEmpty)
                                  {
                                    return'Por favor, insira um email:';
                                  }
                                  return null;

                                },
                              ),
                              TextFormField(
                                controller: _idadeController,
                                decoration: InputDecoration(labelText: 'Idade'),
                                validator: (value){
                                  if(value == null || value.isEmpty)
                                  {
                                    return'Por favor, insira uma idade:';
                                  }
                                  return null;

                                },
                              ),
                              TextFormField(
                                controller: _cursoController,
                                decoration: InputDecoration(labelText: 'Curso'),
                                validator: (value){
                                  if(value == null || value.isEmpty)
                                  {
                                    return'Por favor, insira um curso:';
                                  }
                                  return null;

                                },
                              ),
                              SizedBox(height: 20,),
                              ElevateButtonComponent(
                                  label: "Salvar",
                                  onPressed: _gerarJson,
                                  cor: Colors.green),
                              SizedBox(height: 20,),
                              Text(_jsonOutput)

                            ],
                          ) )


                    ]
                )
            )


        ));
  }
}