import 'dart:ui';
import 'package:adviceat/src/controller/api/yemekGetir.dart';
import 'package:adviceat/src/view/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String mediaUrl = "http://165.22.84.39/media/";
  bool displayText;
  bool selectedIngredients;
  bool selectedInstructions;
  bool selectedInfo;

  @override
  void initState() {
    displayText = true;
    selectedIngredients = false;
    selectedInstructions = false;
    selectedInfo = false;
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
          canvasColor: Colors.transparent.withOpacity(0.5),
          brightness: Brightness.dark,
          primaryColor: Colors.white,
          accentColor: Colors.white,
          dialogBackgroundColor: Colors.transparent),
      home: Scaffold(
          drawer: MyDrawer(context),
          appBar: AppBar(
            backgroundColor: Colors.grey,
            title: Text("Adviceat", style: TextStyle(color: Colors.white)),
          ),
          resizeToAvoidBottomPadding: false,
          body: Material(
              child: SafeArea(
                  child: Stack(fit: StackFit.expand, children: <Widget>[
            InkWell(
              child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: Container(
                    key: ValueKey<int>(YemekJson.selected.yemekId),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.dstOut),
                      image: NetworkImage(
                          mediaUrl + YemekJson.selected.yemekResimUrl),
                      fit: BoxFit.cover,
                    )),
                    child: Padding(
                        padding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).size.height / 5 + 16.0,
                            left: 16.0,
                            right:
                                (MediaQuery.of(context).size.width / 3) - 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AnimatedOpacity(
                                opacity: displayText ? 1.0 : 0.0,
                                duration: Duration(milliseconds: 200),
                                child: Text(YemekJson.selected.yemekAdi,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 34.0))),
                          ],
                        )),
                  )),
              onTap: () {
                if (!displayText) {
                  setState(() {
                    displayText = true;
                    selectedIngredients = false;
                    selectedInstructions = false;
                    selectedInfo = false;
                  });
                }
              },
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Spacer(),
                  Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: frostedIconButton(IconButton(
                        icon: Icon(Icons.restaurant_menu,
                            color: selectedIngredients
                                ? Colors.white
                                : Colors.white70),
                        onPressed: () {
                          setState(() {
                            if (displayText) {
                              displayText = false;
                            }
                            if (selectedIngredients) {
                              displayText = true;
                              selectedIngredients = false;
                            } else {
                              selectedIngredients = true;
                              selectedInstructions = false;
                              selectedInfo = false;
                            }
                          });
                        },
                      ))),
                  Spacer(),
                  Container(
                    height: MediaQuery.of(context).size.height / 4.5,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: YemekJson.recipeList.length,
                      itemBuilder: (context, index) {
                        return recipeCard(context, index);
                      },
                    ),
                  ),
                ],
              ),
            ),
            AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                child: selectedIngredients
                    ? listCard(context, 'Tarif', YemekJson.selected.yemekTarif)
                    : Container(height: 0, width: 0)),
          ])))),
    );
  }

  Widget frostedRound(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: child));
  }

  Widget frostedIconButton(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle),
                child: child)));
  }

  Widget frostedEdged(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: child));
  }

  Widget listCard(BuildContext context, String title, String tarif) {
    return frostedEdged(Container(
        key: ValueKey<String>(title),
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 1.5,
        color: Colors.white.withOpacity(0.3),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
                  child: Text(
                    title,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Divider(color: Colors.white70)),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: ListView(
                      children: <Widget>[Html(data: tarif)],
                    )),
              )
            ])));
  }

  Widget recipeCard(BuildContext context, int index) {
    return InkWell(
      child: Padding(
          padding: EdgeInsets.only(right: 16.0, top: 32.0),
          child: frostedEdged(Container(
              width: MediaQuery.of(context).size.width / 1.75,
              color: Colors.white.withOpacity(0.3),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  width: MediaQuery.of(context).size.width / 5,
                                  height: MediaQuery.of(context).size.width / 5,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(mediaUrl +
                                              YemekJson.recipeList[index]
                                                  .yemekResimUrl)))),
                            ])),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                              width: (MediaQuery.of(context).size.width / 3.5),
                              child: Text(YemekJson.recipeList[index].yemekAdi,
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis)),
                        ])
                  ])))),
      onTap: () {
        setState(() {
          YemekJson.selected = YemekJson.recipeList[index];
        });
      },
    );
  }
}
