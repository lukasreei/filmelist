import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'cadastrobanco/controller.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final Controller _controller = Controller();
  String? erroMessage;
  File? _selectedImage;
  String? _selectedGenre;

  final List<String> _genres = ['ação', 'drama', 'comedia', 'romance', 'suspense', 'shounen'];

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _saveMovie() async {
    final error = await _controller.saveMovie(_selectedImage, _selectedGenre);

    if (error != null) {
      setState(() {
        erroMessage = error;
      });
    } else {
      setState(() {
        erroMessage = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Filme cadastrado'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CADASTRO', style: TextStyle(fontSize: 26, color: Colors.black87)),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              TextField(
                controller: _controller.movieController,
                style: const TextStyle(fontSize: 24),
                decoration: InputDecoration(
                  labelText: 'NAME THE MOVIE',
                  hintText: 'EX: AVENGER',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(24.0)),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _controller.dataController,
                style: const TextStyle(fontSize: 24),
                keyboardType: TextInputType.datetime,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: InputDecoration(
                  labelText: 'DATE',
                  hintText: 'DD/MM/YYYY',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(24.0)),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controller.sinopseController,
                style: const TextStyle(fontSize: 24),
                decoration: InputDecoration(
                  labelText: 'SINOPSE',
                  hintText: 'EX: Vindo de outro planeta...',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(24.0)),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                value: _selectedGenre,
                hint: Text('Selecione o Gênero'),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGenre = newValue;
                  });
                },
                items: _genres.map<DropdownMenuItem<String>>((String genre) {
                  return DropdownMenuItem<String>(
                    value: genre,
                    child: Text(genre),
                  );
                }).toList(),
              ),
              GestureDetector(
                onTap: _pickImage,
                child: _selectedImage != null
                    ? Image.file(_selectedImage!, height: 150, width: 150, fit: BoxFit.cover)
                    : Container(
                  height: 150,
                  width: 150,
                  color: Colors.grey[300],
                  child: Icon(Icons.camera_alt, size: 50, color: Colors.grey[700]),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveMovie,
                child: const Text('Cadastrar filme'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
