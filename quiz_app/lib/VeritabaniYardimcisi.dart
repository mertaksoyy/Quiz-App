import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi{

  static final String veritabaniAdi = "bayrakquiz.sqlite";

  static Future<Database> veritabaniErisim() async{
    String veritabaniYolu = join(await getDatabasesPath(),veritabaniAdi);

    //Veri Tabanı var/yok kontorlü
    if(await databaseExists(veritabaniYolu)){
      print("DB zaten kopyalanmış");
    }
    else{
      //assetten db nin alınması
      ByteData data = await rootBundle.load("veritabani/${veritabaniAdi}");

      //DB nin kopyalanması için byte dönüşümü yapılması
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);

      //DB nin kopyalanması
      await File(veritabaniYolu).writeAsBytes(bytes,flush: true);
      print("DB kopyalandı");
    }
    //Veritabanını açıyoruz.
    return openDatabase(veritabaniYolu);
  }



}