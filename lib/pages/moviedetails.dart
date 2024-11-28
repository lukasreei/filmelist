import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  final String movieName;
  final String movieDate;
  final String movieSinopse;

  const MovieDetailsPage({
    super.key,
    required this.movieName,
    required this.movieDate,
    required this.movieSinopse,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieName),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: $movieName', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Data de lançamento: $movieDate', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Sinopse: $movieSinopse', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
