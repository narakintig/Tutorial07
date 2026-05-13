import 'package:flutter/material.dart';
import 'package:tutorial07/model/filme_model.dart';
import 'package:tutorial07/database.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  final List<Filme> filmes = Database.getFilmes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("CineFlutter"),
          backgroundColor: Colors.deepPurple,
        ),
          
          body: ListView.builder(
            itemCount: filmes.length,
            itemBuilder: (context, index) {
              final filme = filmes[index];
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),

                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 118, 78, 228),
                  borderRadius: BorderRadius.circular(50),
                ),

                child: ListTile(
                tileColor: Colors.deepPurpleAccent,
                leading: Icon(
                  Icons.movie,
                  color: Colors.deepPurple,
                ),
                title: Text(filme.titulo),
                textColor: Colors.white,
                subtitle: Text('Ano: ${filme.anoLancamento}'),
                trailing: Row(
                  mainAxisSize: 
                    MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 18),
                    Text(filme.imdb.toString()),
                  ],
                ),
              onTap:() {
                print('Clicou em: ${filme.titulo}');
              },
              onLongPress: () {
                print('LongPress em: ${filme.titulo}');
              },
                ),
              );
            }
        )
      ),
    );
  }
}

