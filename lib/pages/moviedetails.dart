import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  final String movieName;
  final String movieDate;
  final String movieSinopse;
  final String? imageUrl;

  const MovieDetailsPage({
    super.key,
    required this.movieName,
    required this.movieDate,
    required this.movieSinopse,
    this.imageUrl,
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
            if (imageUrl != null && imageUrl!.isNotEmpty)
              Center(
                child: Image.network(
                  imageUrl!,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              )
            else
              Center(
                child: Icon(
                  Icons.image,
                  size: 100,
                  color: Colors.grey,
                ),
              ),
            SizedBox(height: 20),
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
