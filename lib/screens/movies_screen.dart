import 'package:flutter/material.dart';
import 'package:practica_1/database/movies_database.dart';
import 'package:practica_1/models/moviesdao.dart';
import 'package:practica_1/views/movie_view_item.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

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
        actions: [
          IconButton(
              onPressed: () {
                WoltModalSheet.show(
                    context: context,
                    pageListBuilder: (context) => [
                          WoltModalSheetPage(
                              child: Text('Aqui debe de aparecer el modal'))
                        ]);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
          future: moviesDB.SELECT(),
          builder: (context, AsyncSnapshot<List<MoviesDAO>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                //Esto siempre retorna un Widget
                itemBuilder: (context, index) {
                  //return MovieViewItem(
                  //moviesDAO: snapshot.data![index],
                  //);
                  return Text('Hola');
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
