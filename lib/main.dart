import 'package:Reborn/ekranlar/ana_sayfa.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AnaSayfa()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/REBORN.gif"),
                fit: BoxFit.fill)),
      ),
    );
  }
}

/*void main() => runApp(MyApp());

class YeniClass extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evde Fitness Programı',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFB74093),
        accentColor: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: AnaSayfa(),
    );
  }    
}*/
//Video ile, animasyonla başlatmak için

/* @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          VideoItems(
            videoPlayerController:
                VideoPlayerController.asset('assets/images/healty.mp4'),
                looping: true,
                autoplay: true,
          ),
         
        ],
      ),
    );
  }
}*/
