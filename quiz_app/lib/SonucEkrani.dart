import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';

class SonucEkrani extends StatefulWidget {

  int dogruSayisi;

  SonucEkrani({required this .dogruSayisi});


  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
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
                  Text("Doğru : ${widget.dogruSayisi} -- Yanlış: ${5-w idget.dogruSayisi}",style: TextStyle(fontSize: 20),),
                  Text("Başarı oranınız: %${(widget.dogruSayisi*100/5).toInt()}",style: TextStyle(fontSize: 28,color: Colors.green),),

                  ElevatedButton(
                    child: Text("Tekrar Deneyin"),
                    onPressed:(){
                      Navigator.pop(context);
                    },
                  )
                ],
          ),
        )
    );
  }
}
