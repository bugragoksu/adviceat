import 'package:adviceat/src/controller/api/getMalzeme.dart';
import 'package:adviceat/src/controller/api/yemekGetir.dart';
import 'package:adviceat/src/view/widgets/drawer.dart';
import 'package:flutter/material.dart';

class MalzemeListesi extends StatefulWidget {
  @override
  _MalzemeListesiState createState() => _MalzemeListesiState();
}

class _MalzemeListesiState extends State<MalzemeListesi> {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            canvasColor: Colors.transparent.withOpacity(0.5),
            brightness: Brightness.dark,
            primaryColor: Colors.white,
            accentColor: Colors.white,
            dialogBackgroundColor: Colors.transparent),
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text("Adviceat", style: TextStyle(color: Colors.black)),
            ),
            drawer: MyDrawer(context),
            body: Material(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: MalzemeJson.malzemeList.length,
                        itemBuilder: (BuildContext context, int position) {
                          return Card(
                            elevation: 2.0,
                            child: ListTile(
                              title: Text(MalzemeJson.malzemeList[position].malzemeAdi),
                              trailing: Checkbox(
                                value: MalzemeJson.malzemeList[position].checked,
                                activeColor: Colors.grey.shade100,
                                checkColor: Colors.black,
                                onChanged: (bool flag) {
                                  setState(() {
                                    MalzemeJson.malzemeList[position].checked = flag;
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 200.0,
                    child: RaisedButton(
                     splashColor: Colors.grey.shade100,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      elevation: 2.0,
                      color: Colors.grey,
                      child: Text("Ara"),
                      onPressed: () {
                        setState(() {
                          //veri geliyor ama ekran güncellenmiyor!

                          
                          YemekJson.load(secim: 2);
                          Navigator.pushNamed(context,"/home");
                        });
                        
                      },
                    ),
                  ),
                ],
              ),
            )));
  }
}
