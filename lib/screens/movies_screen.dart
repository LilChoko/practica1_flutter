import 'package:flutter/material.dart';
import 'package:practica_1/database/movies_database.dart';
import 'package:practica_1/models/moviesdao.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late MoviesDatabase moviesDB;

  @override
  void initState() {
    super.initState();
    moviesDB = MoviesDatabase();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies List'),
      ),
      body: FutureBuilder(
          future: moviesDB.SELECT(),
          builder: (context, AsyncSnapshot<List<MoviesDAO>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                //Esto siempre retorna un Widget
                itemBuilder: (context, index) {
                  return MovieViewItem();
                },
              );
            } else {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Algo salio mal :('),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          }),
    );
  }
}
