import 'dart:ui';

import 'package:aoy_media/gonderikarti.dart';
import 'package:aoy_media/profilsayfasi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], 
      appBar: AppBar(
        backgroundColor: Colors.grey[100], /
        elevation: 0.0, 
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.grey,
              size: 32.0,
            ),
            onPressed: () {}),
        title: Text(
          "Social Media",
          style: TextStyle(fontSize: 20.0, color: Colors.black),
        ),
        centerTitle: true, // başlığı ortala
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.red[300],
              size: 32.0,
            ),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      children: <Widget>[
                        duyuru("Emre seni takip etti", "3 dk önce"),
                        duyuru("Salih gönderine yorum yaptı", "1 gün önce"),
                        duyuru("Fatma mesaj gönderdi", "2 hafta önce"),
                      ],
                    );
                  });
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 100.0,
            decoration: BoxDecoration(color: Colors.grey[100], boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 3.0),
                  blurRadius: 5.0) 
            ]),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                profilKartiOlustur(
                  "Oğuzhan",
                  "https://i.imgur.com/DrM0Lzg.jpg",
                  "Oğuzhan Yukacı",
                  "https://i.imgur.com/6hHQCvsb.jpg",
                ),
                profilKartiOlustur(
                  "Emre",
                  "https://i.imgur.com/p50uEPv.jpg",
                  "Emre Karaman",
                  "https://i.imgur.com/3rYHhEub.jpg",
                ),
                profilKartiOlustur(
                  "Galip",
                  "https://i.imgur.com/sdj3MC2.jpeg",
                  "Galip Yıldız",
                  "https://i.imgur.com/q95PckCb.jpg",
                ),
                profilKartiOlustur(
                  "Gülşen",
                  "https://i.imgur.com/2DLrovP.jpg",
                  "Çene",
                  "https://i.imgur.com/dXdW6r1b.jpg",
                ),
                profilKartiOlustur(
                  "Zeynep",
                  "https://i.imgur.com/NxSJfn5.jpg",
                  "Zeynep Keskin",
                  "https://i.imgur.com/KOrsePEb.jpg",
                ),
                profilKartiOlustur(
                  "Sıla",
                  "https://i.imgur.com/dCRVkhg.jpg",
                  "Özgençli",
                  "https://i.imgur.com/1B0Qa7Yb.jpg",
                ),
                profilKartiOlustur(
                  "Eren",
                  "https://i.imgur.com/lkTLwoB.jpg",
                  "Eren Haltaş",
                  "https://i.imgur.com/Q9H1G6Eb.jpg",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          GonderiKarti(
            isimSoyad: "Oğuzhan Yukacı",
            gecenSure: "1 sene önce",
            aciklma: "Geçen yaz çekildim.",
            profilResimLinki: "https://i.imgur.com/YngI8qR.jpg",
            gonderiResimLinki: "https://i.imgur.com/JHHJQOf.jpg",
          ),
          GonderiKarti(
            isimSoyad: "Emre Karaman",
            gecenSure: "2 ay önce",
            aciklma: "Yozgat belediye başkanı",
            profilResimLinki: "https://i.imgur.com/1AZVMF4.jpg",
            gonderiResimLinki: "https://i.imgur.com/qAgDKiI.jpg",
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.purple[300],
        child: Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ),
      ),
    );
  }

  Padding duyuru(String mesaj, String gecenSure) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            mesaj,
            style: TextStyle(fontSize: 15.0),
          ),
          Text(gecenSure)
        ],
      ),
    );
  }

  Widget profilKartiOlustur(String kullaniciAdi, String resimLinki,
      String isimSoyad, String kapakResimLinki) {
    return Material(
      child: InkWell(
        onTap: () async {
          bool donenVeri = await Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ProfilSayfasi(
                    profilResimLinki: resimLinki,
                    kullaniciAdi: kullaniciAdi,
                    isimSoyad: isimSoyad,
                    kapakResimLinki: kapakResimLinki,
                  )));
          if (donenVeri) {
            print("Kullanıcı profil sayfaından döndü.");
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0), 
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Hero(
                    tag: kullaniciAdi,
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2.0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(35.0),
                          image: DecorationImage(
                              image: NetworkImage(resimLinki),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(width: 2.0, color: Colors.white)),
                  )
                ],
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                kullaniciAdi,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
