import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Controller {
  final TextEditingController movieController = TextEditingController();
  final TextEditingController sinopseController = TextEditingController();
  final TextEditingController dataController = TextEditingController();

  Future<String?> saveMovie() async {
    final movie = movieController.text;
    final sinopse= sinopseController.text;
    final data = dataController.text;
    if (movie.isEmpty || sinopse.isEmpty || data.isEmpty) {
      return("preencha todos os campos.");
    }

    try {
      await FirebaseFirestore.instance.collection('movies').add({
        'movie':movie,
        'sinopse':sinopse,
        'data':data,
      });
      movieController.clear();
      sinopseController.clear();
      dataController.clear();

      return null;
    } catch (e) {
      return "erro ao salvar filme: $e";
    }
  }
}
