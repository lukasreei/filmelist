import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:filmelist/pages/cadastrobanco/controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  _CadastroState createState() => _CadastroState();
}
  class _CadastroState extends State<Cadastro>{
  final Controller _controller = Controller();
  String? erroMessage;

  void _saveMovie() async {
    final error = await _controller.saveMovie();

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
        title: Text('CADASTRO', style: TextStyle(fontSize: 26,color: Colors.black87),),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 24,),
            TextField(
              controller: _controller.movieController,
              style: const TextStyle(fontSize: 24),
              decoration: InputDecoration(
                labelText: 'NAME THE MOVIE',
                hintText: 'EX: AVENGER',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0)
                ),
              ),
            ),
            SizedBox(height: 24,),
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0)
                )
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _controller.sinopseController,
              style: const TextStyle(fontSize: 24),
              decoration: InputDecoration(
                labelText: 'SINOPSE',
                hintText: 'EX: Vindo de outro planeta...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0)
                )
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: _saveMovie, child: const Text('Cadastrar filme'),)
          ],
        ),
        )
      ),
    );
  }
}
