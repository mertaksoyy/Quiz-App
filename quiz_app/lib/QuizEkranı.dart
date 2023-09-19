import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Bayraklar.dart';
import 'package:quiz_app/Bayraklardao.dart';
import 'package:quiz_app/SonucEkrani.dart';

class QuizEkrani extends StatefulWidget {
   QuizEkrani({super.key});

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {

  var sorular = <Bayraklar>[];//--> db den gelecek Tüm sorular
  var yanlisSecenekler = <Bayraklar>[];//-->db den gelecek yanlış şıklar
  late Bayraklar anaSoru;//--> db den gelen cevap olan soruda gösterilen/soruda görünen bayrak
  var tumSecenekler = HashSet<Bayraklar>();//D ve Y Şıklarını karıştıracak.-->HashSet in özelliği içindeki verileri karıştırır.

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

  //ilk açıldığında gelicek
  Future<void> sorulariAl() async{
    sorular = await Bayraklardao().rastgele5Getir();//5 tane bayrağı sorular listesine atar.
    soruYukle();
  }

  //5 soruyu aldıktan sonra arayüze yükleyeceğimiz fonk.
  Future<void> soruYukle() async{
    anaSoru = sorular[soruSayac];

    bayrakResimAdi = anaSoru.bayrak_resim;//bayrağın resmi

    yanlisSecenekler = await Bayraklardao().rastgele3YanlisGetir(anaSoru.bayrak_id);

    //Seçenklerde 1d-3y seçenek var ve bunları karıştıracak
    tumSecenekler.clear();
    tumSecenekler.add(anaSoru);
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

  void dogruKontrol(String buttonYazi){
    if(anaSoru.bayrak_ad == buttonYazi){
      dogruSayac += 1;
    }
    else{
      yanlisSayac += 1;
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
                  Text("Doğru : $dogruSayac ",style: TextStyle(fontSize: 20),),
                  Text("Yanlış : $yanlisSayac ",style: TextStyle(fontSize: 20),),
                ],
              ),

              soruSayac != 5 ? Text("${soruSayac+1}",style: TextStyle(fontSize: 25),):
              Text("5.Soru" ,style: TextStyle(fontSize: 25),),
              Image.asset("resimler/$bayrakResimAdi"),
              SizedBox(
                width: 250,height: 50,
                child: ElevatedButton(
                  child:  Text(butonA,style: TextStyle(fontSize: 20),),
                  onPressed: (){
                    dogruKontrol(butonA);
                    soruSayacKontrol();
                  },
                ),
              ),
              SizedBox(
                width: 250,height: 50,
                child: ElevatedButton(
                  child: Text(butonB,style: TextStyle(fontSize: 20),),
                  onPressed: (){
                    dogruKontrol(butonB);
                    soruSayacKontrol();
                  },
                ),
              ),
              SizedBox(
                width: 250,height: 50,
                child: ElevatedButton(
                  child:  Text(butonC,style: TextStyle(fontSize: 20),),
                  onPressed: (){
                    dogruKontrol(butonC);
                    soruSayacKontrol();
                  },
                ),
              ),
              SizedBox(
                width: 250,height: 50,
                child: ElevatedButton(
                  child:  Text(butonD,style: TextStyle(fontSize: 20),),
                  onPressed: (){
                    dogruKontrol(butonD);
                    soruSayacKontrol();
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}
