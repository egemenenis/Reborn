import 'package:Reborn/degerler/fonksiyon.tanimlamalari.dart';
import 'package:Reborn/degerler/fonksiyon_degerleri.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class YedekEkran extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final TiklanincaAcilanEkran spor_karti;

  // ignore: non_constant_identifier_names
  YedekEkran({required this.spor_karti});

  @override
  _YedekEkranState createState() => _YedekEkranState();
}

class _YedekEkranState extends State<YedekEkran> {
  Text _buildGuceEtkisi(int etkisi) {
    String etki = '';
    for (int i = 0; i < etkisi; i++) {
      etki += '☑  ';
    }
    etki.trim();
    return Text(etki);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.shortestSide,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),

                  //ikincil ekran arka plan yansıması
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 5.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.spor_karti.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image(
                      image: AssetImage(widget.spor_karti.imageUrl),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Padding(
                //Spor kartlarının içindeki ikonların konumları
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    //Spor kartlarının içindeki ikonlar
                    IconButton(
                      icon: Icon(FontAwesomeIcons.youtube),
                      iconSize: 30.0,
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),

                    IconButton(
                      icon: Icon(FontAwesomeIcons.amazon),
                      iconSize: 30.0,
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),

                    IconButton(
                      icon: Icon(Icons.logout),
                      iconSize: 25.0,
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),

              //Kartlara tıkladıktan sonra çıkan başlık ve dumbell
              Positioned(
                top: 200.0,
                left: 150.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.spor_karti.hangiBolge,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.dumbbell,
                          size: 25.0,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5.0),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 25.0, bottom: 15.0),
              itemCount: widget.spor_karti.spor.length,
              itemBuilder: (BuildContext context, int index) {
                // ignore: unused_local_variable
                Spor spor = widget.spor_karti.spor[index];

                // ignore: unused_local_variable
                // Spor sporBir =widget.spor_karti.sporBir[index];

                return Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 3.0),
                      height: 150.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.pink[400],
                        borderRadius: BorderRadius.circular(70.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(125.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 120.0,
                                  child: Text(
                                    spor.name,
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '${spor.kcal} \kcal',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      'Yakılan kalori',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              //Başlangıç-Profesyonel
                              spor.type,
                              style: TextStyle(color: Colors.white),
                            ),
                            _buildGuceEtkisi(spor.etki),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                //30 sn kutusu
                                Container(
                                  padding: EdgeInsets.all(1.0),
                                  width: 75.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    spor.startTimes[0],
                                  ),
                                ),
                                SizedBox(width: 10.0),

                                //60 sn kutusu
                                Container(
                                  padding: EdgeInsets.all(1.0),
                                  width: 75.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    spor.startTimes[1],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    //Spor kutusu altındaki resim ayarları
                    Positioned(
                      left: 20.0,
                      top: 15.0,
                      bottom: 15.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image(
                          width: 110.0,
                          image: AssetImage(
                            spor.imageUrl,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/*Future _urlAc(String link) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    debugPrint('Link açılırken hata oldu');
  }
}

  ListTile(
                      leading: Icon(FontAwesomeIcons.amazon),
                      title: Text('Amazon'),
                      onTap: () {
                        Navigator.pop(context);
                        _urlAc('https://www.amazon.com.tr');
                      },*/
