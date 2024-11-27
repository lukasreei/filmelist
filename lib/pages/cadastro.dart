import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

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
              style: const TextStyle(fontSize: 24),
              decoration: InputDecoration(
                labelText: 'SINOPSE',
                hintText: 'EX: Vindo de outro planeta...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0)
                )
              ),
            ),

          ],
        ),
        )
      ),
    );
  }
}
