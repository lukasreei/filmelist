import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final String query;

  const Search({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('pesquisa'),
      ),
    );
  }
}
