import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/SonucEkrani.dart';

class QuizEkrani extends StatefulWidget {
  const QuizEkrani({super.key});

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quiz Ekranı"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Doğru : 1 ",style: TextStyle(fontSize: 20),),
                  Text("Yanlış : 1 ",style: TextStyle(fontSize: 20),),
                ],
              ),

              Text("1.Soru",style: TextStyle(fontSize: 25),),
              Image.asset("resimler/turkiye.png"),
              SizedBox(
                width: 250,height: 50,
                child: ElevatedButton(
                  child: const Text("A:",style: TextStyle(fontSize: 20),),
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(dogruSayisi: 3)));
                  },
                ),
              ),
              SizedBox(
                width: 250,height: 50,
                child: ElevatedButton(
                  child: const Text("B:",style: TextStyle(fontSize: 20),),
                  onPressed: (){
                   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani()));
                  },
                ),
              ),
              SizedBox(
                width: 250,height: 50,
                child: ElevatedButton(
                  child: const Text("C:",style: TextStyle(fontSize: 20),),
                  onPressed: (){
                    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani()));
                  },
                ),
              ),
              SizedBox(
                width: 250,height: 50,
                child: ElevatedButton(
                  child: const Text("D:",style: TextStyle(fontSize: 20),),
                  onPressed: (){
                    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani()));
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}
