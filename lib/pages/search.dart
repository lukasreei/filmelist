import 'package:filmelist/pages/moviedetails.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Search extends StatelessWidget {
  final String query;

  const Search({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('SEARCH'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('movies')
            .where('movie', isGreaterThanOrEqualTo: query)
            .where('movie', isLessThan: query + 'z')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro ao buscar resultados.'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('Nenhum resultado encontrado para "$query".'));
          }

          final results = snapshot.data!.docs;
          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              final result = results[index];
              final data = result.data() as Map<String, dynamic>;

              final movieName = data['movie'] ?? 'Sem título';
              final movieDate = data['data'] ?? 'Data desconhecida';
              final movieSinopse = data['sinopse'] ?? 'Sem sinopse';
              final imageUrl = data['imageUrl'] ?? null;

              return ListTile(
                leading: imageUrl != null
                    ? Image.network(imageUrl, width: 50, height: 50, fit: BoxFit.cover)
                    : Icon(Icons.movie, size: 50),
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
