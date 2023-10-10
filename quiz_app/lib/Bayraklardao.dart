import 'package:quiz_app/Bayraklar.dart';
import 'package:quiz_app/VeritabaniYardimcisi.dart';

class Bayraklardao{

  //5 soru için rastegele veri çektik
  Future<List<Bayraklar>> rastgele5Getir() async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    //Query sonucu bana rastegele bayraklar tablosundan 5 bayrak getirecek.
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar ORDER BY RANDOM() LIMIT 5");

    //gelen rastgele bayrağı fonksiyon bizden bir liste döndermemizi istdediği için list.generate yaptım
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Bayraklar(satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);
    });
  }

  //Yanlış şıkları çektiğimiz kısım-fonksiyon içerisine dışardan aldığımız bayrak_id bizim doğru seçeneğimiz olacak.
  Future<List<Bayraklar>> rastgele3YanlisGetir(int bayrak_id) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar WHERE bayrak_id != $bayrak_id  ORDER BY RANDOM() LIMIT 3");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Bayraklar(satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);
    });
  }






}