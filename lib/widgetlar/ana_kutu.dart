import 'package:Reborn/degerler/fonksiyon_degerleri.dart';
import 'package:Reborn/ekranlar/tiklaninca_acilan_ekran.dart';
import 'package:flutter/material.dart';

class AnaKutu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[],
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: kartAciklamalari.length,
            itemBuilder: (BuildContext context, int index) {
              TiklanincaAcilanEkran aciklama = kartAciklamalari[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  //yedek ekrana geçmek için kullanılır
                  MaterialPageRoute(
                    builder: (_) => YedekEkran(
                      spor_karti: aciklama,
                    ),
                  ),
                ),
                child: Container(
                  //Spor kartı kutularının genişliği

                  //kartların birbirine uzaklığı
                  margin: EdgeInsets.all(10),

                  //kartların büyüklüğü(enine)
                  width: 186.5,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        child: Container(
                          height: 300.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(35.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  aciklama.baslik,
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.pink[200]),
                                ),
                                Text(
                                  aciklama.neIseYarar,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],

                          //arka golgeyi olusturur
                          /* borderRadius: BorderRadius.circular(250.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(5.0, 10.0),
                              blurRadius: 500.0,
                            ),
                          ],*/
                        ),
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag: aciklama.imageUrl,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25.0),
                                child: Image(
                                  height: 200.0,
                                  width: 250.0,
                                  image: AssetImage(aciklama.imageUrl),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
