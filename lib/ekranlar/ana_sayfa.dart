import 'package:Reborn/arama.dart';
import 'package:Reborn/widgetlar/ana_kutu.dart';
import 'package:Reborn/widgetlar/egzersiz_merkezi.dart';
import 'package:Reborn/widgetlar/oneri_merkezi.dart';
import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

// Dörtlü ikon simgeleri
class _AnaSayfaState extends State<AnaSayfa> {
  // ignore: unused_field
  int _selectedIndex = 1;
  int _currentIndex = 1;
  late List<Widget> tumSayfalar;
  late AnaSayfa sayfaAna;
  late AramaSayfasi sayfaArama;

  @override
  void initState() {
    super.initState();
    tumSayfalar = [sayfaAna, sayfaArama];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          //padding: EdgeInsets.symmetric(vertical: 10.0),
          children: <Widget>[
            EgzersizMerkezi(),
            SizedBox(height: 25.0),
            AnaKutu(),
            SizedBox(height: 20.0),
            OneriMerkezi(),
          ],
        ),
      ),
      /* body: _currentIndex <= tumSayfalar.length - 1
          ? tumSayfalar[_currentIndex]
          : tumSayfalar[1],*/

      ////Alttaki simgeler
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        //Simge geçişlerindeki değişikliği sağlayan kod
        type: BottomNavigationBarType.shifting,
        //Alttaki sayfa geçişleri
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pages,
                size: 30.0,
              ),
              // ignore: deprecated_member_use
              label: "2. Sayfa",
              backgroundColor: Colors.pink),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30.0,
              ),
              // ignore: deprecated_member_use
              label: "Home",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15.0,
                backgroundImage: NetworkImage(
                    'https://ozgunresimler.com/wp-content/uploads/2020/05/10_en-ilginc%CC%A7-profil-fotog%CC%86raflar%C4%B1-kopya.jpg'),
              ),
              // ignore: deprecated_member_use
              label: "Profile",
              backgroundColor: Colors.grey[400])
        ],
      ),
    );
  }
}
