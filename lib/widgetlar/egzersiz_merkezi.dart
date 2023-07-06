import 'package:Reborn/degerler/egzersiz_resimleri.dart';
import 'package:flutter/material.dart';

class EgzersizMerkezi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          //Üst yazının konumu
          padding: EdgeInsets.only(left: 20.0, right: 20.0),

          child: Text(
            'Spor öncesi aşağıdaki egzersizleri uygulayınız.',
            style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
                fontFamily: 'Bebas',
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 190.0,
          width: 500.0,
          child: ListView.builder(
            //Egzersizleri doğru kayacağını belirler
            scrollDirection: Axis.horizontal,
            itemCount: egzersizKartlari.length,
            itemBuilder: (BuildContext context, int index) {
              EgzersizResimleri egzersizResimleri = egzersizKartlari[index];

              return Container(
                color: Colors.black87,
                width: 195.0,
                height: 150.0,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100.0),
                        boxShadow: [
                          //Egzersiz hareketlerinin gölgelendirmesi
                          BoxShadow(
                            color: Colors.pink,
                            offset: Offset(0.0, 65.0),
                            blurRadius: 500.0,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image(
                          height: 125.0,
                          width: 180.0,
                          image: AssetImage(egzersizResimleri.imageUrl),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
