import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Controller {
  final TextEditingController movieController = TextEditingController();
  final TextEditingController sinopseController = TextEditingController();
  final TextEditingController dataController = TextEditingController();

  Future<String?> saveMovie(File? imageFile, String? genre) async {
    final movie = movieController.text;
    final sinopse = sinopseController.text;
    final data = dataController.text;

    if (movie.isEmpty || sinopse.isEmpty || data.isEmpty || genre == null) {
      return "Preencha todos os campos.";
    }

    String? imageUrl;

    if (imageFile != null) {
      try {
        final storageRef = FirebaseStorage.instance.ref().child('movies/${DateTime.now().toIso8601String()}.jpg');
        final uploadTask = await storageRef.putFile(imageFile);
        imageUrl = await uploadTask.ref.getDownloadURL();
      } catch (e) {
        return "Erro ao fazer upload da imagem: $e";
      }
    }

    try {
      await FirebaseFirestore.instance.collection('movies').add({
        'movie': movie,
        'sinopse': sinopse,
        'data': data,
        'genre': genre,
        'imageUrl': imageUrl,
      });
      movieController.clear();
      sinopseController.clear();
      dataController.clear();

      return null;
    } catch (e) {
      return "Erro ao salvar filme: $e";
    }
  }
}
