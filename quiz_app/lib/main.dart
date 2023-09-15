import 'package:flutter/material.dart';
import 'package:quiz_app/QuizEkran%C4%B1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});



  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title:const  Text("Ana Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Padding(
               padding: const EdgeInsets.all(25.0),
               child: Text("Quiz App",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
             ),
            SizedBox(
              width: 250,height: 50,
              child: ElevatedButton(
                child: const Text("Başla",style: TextStyle(fontSize: 20),),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuizEkrani()));
                },
              ),
            )
          ],
        ),

      )
    );
  }
}
