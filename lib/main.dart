import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:insta_datas/homepage.dart';

void main() {
  runApp(MyApp());
  FirebaseAdMob.instance.initialize(
    appId: "ca-app-pub-1921914374902301~3091424041",
  );

  InterstitialAd myInterstitial = InterstitialAd(
    adUnitId: "ca-app-pub-1921914374902301/5336892557",
    listener: (MobileAdEvent event) {
      print("InterstitialAd event is $event");
    },
  );
  myInterstitial
    ..load()
    ..show(
      anchorType: AnchorType.bottom,
      anchorOffset: 0.0,
      horizontalCenterOffset: 0.0,
    );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Instagram Verileri",
      home: HomePage(),
    );
  }
}
