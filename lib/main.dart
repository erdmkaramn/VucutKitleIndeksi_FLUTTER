import 'dart:ffi';

import 'package:flutter/material.dart';

int currentindex = 0;
var sonuc = "";
var durum="";
double b = 0;
double k = 0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: vki(),
    );
  }
}

class vki extends StatefulWidget {
  const vki({Key? key}) : super(key: key);

  @override
  _vkiState createState() => _vkiState();
}

class _vkiState extends State<vki> {
  TextEditingController boy = TextEditingController();
  TextEditingController kilo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text(
            "VÜCUT KİTLE İNDEKSİ HESAPLAMA",
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0.0,
          backgroundColor: Colors.indigo[300],
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text("Cinsiyet",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold))),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    radioButton("Erkek", Colors.blue, 0),
                    radioButton("Kadın", Colors.pink, 1),
                  ],
                ),
                SizedBox(height: 10.0),
                /*  Text("Boyunuzu Giriniz (Cm):",style: TextStyle(
                    fontSize: 18.0,
                  ),
                  ),*/
                TextField(
                  keyboardType: TextInputType.number,
                  controller: boy,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Boy (Cm)", //textField içine yazı
                      filled: true, //textField'in sınırlarını çizer
                      fillColor: Colors
                          .lightBlueAccent[50], //textField'in içinin rengi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      )),
                ),
                /* SizedBox(
                  height: 20.0,
                ),
                */
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: kilo,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Kilo (Kg)", //textField içine yazı
                      filled: true, //textField'in sınırlarını çizer
                      fillColor: Colors
                          .lightBlueAccent[50], //textField'in içinin rengi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  height: 40.0,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        b = double.parse(boy.value.text);
                        k = double.parse(kilo.value.text);
                      });

                      hesap(b, k);
                    },
                    color: Colors.indigo[300],
                    child: Center(
                        child: Text(
                      "Hesapla",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "Vücut kitle indeksiniz: ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "$sonuc",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "$durum",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  void hesap(double boy, double kilo) {
    var finalsonuc = kilo / ((boy * boy)/10000);
    var deger = finalsonuc.toStringAsFixed(2);
    setState(() {
      if(double.parse(deger)<=18.5){
      durum="Düşük Kilosunuz";
    }
      else if(double.parse(deger)>18.5 && double.parse(deger)<25){ 
      durum="Normal Kilosunuz";
      }
      else if(double.parse(deger)>25 && double.parse(deger)<30){ 
      durum="Fazla Kilosunuz";
      }
      else{
      durum="Obezsiniz";
      }
    });
    
    setState(() {
      sonuc = deger;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      height: 80.0,
      child: FlatButton(
        color: currentindex == index ? color : Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onPressed: () {
          changeIndex(index);
        },
        child: Container(
          width: double.infinity,
          child: Text(
            value,
            style: TextStyle(
              color: currentindex == index ? Colors.white : color,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ));
  }
}
