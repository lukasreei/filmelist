import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:filmelist/pages/moviedetails.dart';

class New extends StatelessWidget {
  const New({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('NEW'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('movies').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar filmes'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('Nenhum filme encontrado'));
          }

          final movies = snapshot.data!.docs;

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              final data = movie.data() as Map<String, dynamic>;

              final movieName = data['movie'] ?? 'Sem nome';
              final movieDate = data['data'] ?? 'Data desconhecida';
              final movieSinopse = data['sinopse'] ?? 'Sem sinopse';
              final imageUrl = data['imageUrl'] ?? null;

              return ListTile(
                title: Text(movieName),
                subtitle: Text(movieDate),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailsPage(
                        movieName: movieName,
                        movieDate: movieDate,
                        movieSinopse: movieSinopse,
                        imageUrl: imageUrl,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
