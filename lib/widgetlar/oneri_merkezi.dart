import 'package:Reborn/degerler/oneri_kutulari_klasoru.dart';
import 'package:flutter/material.dart';

class OneriMerkezi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Önerilerimiz',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 19.0,

                    //Önerilerimiz yazısının üzerindeki çizgi
                    decoration: TextDecoration.overline,
                    color: Colors.pink[400]),
              ),
            ],
          ),
        ),
        Container(
          height: 200.0,
          child: ListView.builder(
            //Önerilerin ne tarafa doğru kayacağını belirler
            scrollDirection: Axis.horizontal,
            itemCount: oneriKartlari.length,
            itemBuilder: (BuildContext context, int index) {
              OneriKutulari oneriAciklamalari = oneriKartlari[index];

              return Container(
                margin: EdgeInsets.all(5.0),
                width: 400.0,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: <Widget>[
                    Positioned(
                      bottom: 15.0,
                      child: Container(
                        height: 150.0,
                        width: 400.0,
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              //Önerinin ismi
                              Text(
                                oneriAciklamalari.name,
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                    color: Colors.white),
                              ),

                              SizedBox(height: 2.0),

                              //Ortalama yazısı
                              Text(
                                oneriAciklamalari.ort,
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 5.0),

                              //Önerinin miktari
                              Text(
                                '${oneriAciklamalari.miktar} / Günlük',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          height: 180.0,
                          width: 220.0,
                          image: AssetImage(oneriAciklamalari.imageUrl),
                          fit: BoxFit.cover,
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
