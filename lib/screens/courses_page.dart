import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/menu_drawer.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
final List<Map<String,String>> _courses=[
{
  'nome':'Costura',
  'imagem':'assets/images/costura.webp',
  'descricao':'Curso voltado ao aprendizado de técnicas de corte, costura e confecção de peças de vestuário, abordando desde o uso de máquinas e ferramentas básicas até acabamentos e modelagem.',
  'duracao':'40 horas'
},
  {
    'nome':'Eletrotécnica',
    'imagem':'assets/images/eletrotecnica.jpg',
    'descricao':'Curso que capacita o aluno a instalar, manter e reparar sistemas elétricos residenciais e industriais, com foco em segurança, leitura de esquemas elétricos e normas técnicas.',
    'duracao':'50 horas'
  },
  {
    'nome':'Informática',
    'imagem':'assets/images/informatica.jpg',
    'descricao':'Curso que desenvolve competências em uso de computadores, sistemas operacionais, pacotes de escritório e noções de programação e redes, preparando o aluno para o mercado de tecnologia.',
    'duracao':'40 horas'
  },
  {
    'nome':'Mecânica',
    'imagem':'assets/images/mecanica.jpg',
    'descricao':'Curso voltado à formação em manutenção, montagem e reparo de máquinas e equipamentos mecânicos, com ênfase em leitura de desenhos técnicos, ferramentas e processos industriais.',
    'duracao':'60 horas'
  },


];



@override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blueAccent,
      title: Text("Tela De Cursos"),
    ),
    drawer: MenuDrawer(),
    body: Padding(
      padding: EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: _courses.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
        ),
        itemBuilder: (context, index)
        {
          final courses = _courses[index];
          return _buildCardDestino(courses);
        },
      ),
    ),
  );
}



Widget _buildCardDestino(Map<String, String> courses) {
  final String nome = courses['nome'] ?? '';
  final String imagem = courses['imagem'] ?? '';
  final String duracao = courses['duracao'] ?? '';

  //InkWell deixa o componente filho clicavel desenhando um efeito o mesmo .
  return InkWell(
    onTap: () => _abirDetalhesDoLugar(courses),
    child: Card(
      elevation: 3,
      //Aqui usamos Stack porque queremos colocar o nome do lugar na frente da imagem e não embaixo dela
      child: Stack(
        fit: StackFit.expand,
        children: [
          //ClipRRect recorta o componente filho, para que imagem fique com cantos arredondados
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imagem,
              fit: BoxFit.cover,
            ),
          ),
          //Posição onde dentrodo stack esse elemento vai ficar
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.55),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),

                    )
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nome,
                      style: TextStyle(
                        color: Colors.white,
                      ),

                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.amber,
                          size: 14,
                        ),
                        SizedBox(width: 2,),
                        Expanded(
                            child:Text(duracao, style: TextStyle(
                              color: Colors.white,
                            ),)
                        )
                      ],
                    ),
                  ],
                ),
              )
          )

        ],
      ),
    ),
  );
}


//abre bottomsheet (moda) com mas detalhes d destino escolhido
void _abirDetalhesDoLugar(Map<String, String> courses){
  showModalBottomSheet(
      context: context,
      //Permite que o conteudo do showModalBottomSheet ultrapasse a altura padrão respeitando o tamanho da tela
      isScrollControlled: true,
      builder: (context){
        return Padding(padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Foto grande do lugar
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16),
                child: SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset(courses['imagem'] ?? '',
                      fit:BoxFit.fill
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(courses['nome']??''),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.location_on,size: 16,),
                  SizedBox(width: 6,),
                  Text(courses['duracao'] ?? ''),

                ],
              ),
              SizedBox(height: 16,),
              Text(courses['descricao'] ?? '')
            ],
          ),
        );
      }
  );
}
}
