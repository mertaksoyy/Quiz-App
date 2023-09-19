import 'dart:collection';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Bayraklar.dart';
import 'package:quiz_app/Bayraklardao.dart';
import 'package:quiz_app/SonucEkrani.dart';

class QuizEkrani extends StatefulWidget {
  const QuizEkrani({super.key});

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {

  var sorular = <Bayraklar>[];//--> db den gelecek Tüm sorular
  var yanlisSecenekler = <Bayraklar>[];//-->db den gelecek yanlış şıklar
  late Bayraklar dogruSoru; //db den gelen cevap olan soruda gösterilen/soruda görünen bayrak
  var tumSecenekler = HashSet<Bayraklar>();//-->a-b-c-d secenekler,HashSet içersindeki içeriğini otomatik karıştırıcak,seçeneklerin yeri karışacak.

  int soruSayac = 0;
  int dogruSayac = 0;
  int yanlisSayac = 0;
  String bayrakResimAdi = "placeholder.png";
  String butonA = "";
  String butonB = "";
  String butonC = "";
  String butonD = "";

  @override
  void initState() {
    super.initState();
    sorulariAl();
  }

  Future<void> sorulariAl() async{
    sorular = await Bayraklardao().rastgele5Getir();//5 tane bayrağı sorular listesine atar.
  }

  //5 soruyu aldıktan sonra arayüze yükleyeceğimiz fonk.
  Future<void> soruYukle() async{
    dogruSoru = sorular[soruSayac];

    bayrakResimAdi = dogruSoru.bayrak_resim;//bayrağın resmi

    yanlisSecenekler = await Bayraklardao().rastgele3YanlisGetir(dogruSoru.bayrak_id);

    //Seçenklerde 1d-3y seçenek var ve bunları karıştıracak
    tumSecenekler.clear();
    tumSecenekler.add(dogruSoru);
    tumSecenekler.add(yanlisSecenekler[0]);
    tumSecenekler.add(yanlisSecenekler[1]);
    tumSecenekler.add(yanlisSecenekler[2]);

    //Şıklara bayrakları yazdırma
    butonA = tumSecenekler.elementAt(0).bayrak_ad;
    butonB = tumSecenekler.elementAt(1).bayrak_ad;
    butonC = tumSecenekler.elementAt(2).bayrak_ad;
    butonD = tumSecenekler.elementAt(3).bayrak_ad;

    setState(() {

    });
  }

  void soruSayacKontrol(){
    soruSayac += 1;
    if(soruSayac != 5){
      soruYukle();
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(dogruSayisi: dogruSayac,)));
    }
  }






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
