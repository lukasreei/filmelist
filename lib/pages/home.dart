import 'package:flutter/material.dart';
import 'package:filmelist/pages/cadastro.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TOMATES'),titleTextStyle: TextStyle(color: Colors.black87, fontSize: 28),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Cadastro()),
                    );
                  }, child: Text('SING UP'),
                  ),
                  SizedBox(width: 25,),
                  ElevatedButton(onPressed: (){}, child: Text('NEW'),
                  ),
                ],
              ),
            SizedBox(height: 35,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                style: const TextStyle(fontSize: 24),
                decoration: InputDecoration(labelText: 'SEARCH',
                    labelStyle: const TextStyle(fontSize: 26,color: Colors.black87,),
                    hintText: 'GAME OF THRONES',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0)
                )),
              ),
            ),
            SizedBox(height: 24,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('POPULAR',style: TextStyle(fontSize: 20),),
                SizedBox(width: 95,),
                Text('RECOMMENDED', style: TextStyle(fontSize: 20),)
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Expanded(child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  color: Color(0xFFF5DEB3),
                  height: 160,
                  child: ListView(
                    padding: EdgeInsets.all(10),
                    children: [
                      Text('ARCANE', style: TextStyle(fontSize: 20),),
                      SizedBox(height: 10,),
                      Text('GAME OF THRONES', style: TextStyle(fontSize: 20),),
                      SizedBox(height: 10,),
                      Text('SUPER NATURAL', style: TextStyle(fontSize: 20),),
                      SizedBox(height: 10,),
                      Text('THE BOYS', style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ),
                ),
                Expanded(child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  color: Color(0xFFF5DEB3),
                  height: 160,
                  child: ListView(
                    padding: EdgeInsets.all(10),
                    children: const [
                      Text('DAIMA', style: TextStyle(fontSize: 20),),
                      SizedBox(height: 15,),
                      Text('ONE PIECE', style: TextStyle(fontSize: 20),),
                      SizedBox(height: 10,),
                      Text('MY HERO ACADEMIA', style: TextStyle(fontSize: 20),),
                      SizedBox(height: 10,),
                      Text('YOUR NAME', style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('LAUNCH', style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_left, size: 40,)),
                Container(
                  width: 300,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(image:AssetImage('assets/images/daima.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_right, size: 40),
                  onPressed: () {},
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
