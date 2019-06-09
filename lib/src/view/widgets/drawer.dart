//import 'package:adviceat/src/controller/api/getKategori.dart';
import 'package:adviceat/src/controller/api/login.dart';
import 'package:adviceat/src/controller/api/yemekGetir.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget MyDrawer(context) {
  String mediaUrl="http://165.22.84.39/media/";
  return new Padding(
    padding: EdgeInsets.only(top: 30.0),
    child: Drawer(
        elevation: 50.0,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListView(
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    new UserAccountsDrawerHeader(
                      accountName: new Text(Login.user.adi+" "+Login.user.soyadi,
                          style: TextStyle(color: Colors.white)),
                      accountEmail: new Text(Login.user.email,
                          style: TextStyle(color: Colors.white)),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(
                          mediaUrl+Login.user.resimUrl,
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(0.5)),
                    ),
                    new ListTile(
                      title: new Text(
                        "Ana Sayfa",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: new Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      onTap: () {
                        YemekJson.load(secim: 0);
                        Navigator.pushNamed(context, "/home");
                      },
                    ),
                    new ListTile(
                      title: new Text(
                        "Yemek Arama",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: new Icon(
                        FontAwesomeIcons.utensils,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/malzeme');
                      },
                    ),
                    new ExpansionTile(
                      trailing: Icon(Icons.expand_more, color: Colors.white),
                      title: new Text(
                        "Kategoriler",
                        style: TextStyle(color: Colors.white),
                      ),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Column(
                            children: <Widget>[
                              /*Expanded(
                                child: Container(
                                  child: ListView.builder(
                                  itemCount: KategoriJson.kategoriList.length,
                                  itemBuilder:
                                      (BuildContext context, int position) {
                                    return ListTile(
                                      title: new Text(
                                        KategoriJson
                                            .kategoriList[position].kategoriAdi,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onTap: () {},
                                    );
                                  },
                                ),
                                )
                              )*/
                              new ListTile(
                                title: new Text(
                                  "Makarnalar",
                                  style: TextStyle(color: Colors.white),
                                ),
                                
                                onTap: () {
                                  YemekJson.load(secim:1,kategoriId: 1);
                                  Navigator.pushNamed(context, "/home");
                                },
                              ),
                              new ListTile(
                                title: new Text(
                                  "Çorbalar",
                                  style: TextStyle(color: Colors.white),
                                ),
                               
                                onTap: () {
                                  YemekJson.load(secim:1,kategoriId: 3);
                                  Navigator.pushNamed(context, "/home");
                                },
                              ),
                              new ListTile(
                                title: new Text(
                                  "Pizzalar",
                                  style: TextStyle(color: Colors.white),
                                ),
                               
                                onTap: () {
                                  YemekJson.load(secim:1,kategoriId: 2);
                                  Navigator.pushNamed(context, "/home");
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    new ListTile(
                      title: new Text(
                        "İletişim",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: new Icon(
                        Icons.contact_phone,
                        color: Colors.white,
                      ),
                      onTap: () {},
                    ),
                    new ListTile(
                      title: new Text(
                        "Çıkış Yap",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: new Icon(FontAwesomeIcons.signOutAlt,
                          color: Colors.white),
                      onTap: () {
                        Navigator.pushNamed(context, "/");
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
  );
}
