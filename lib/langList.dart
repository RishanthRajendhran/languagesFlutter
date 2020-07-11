import 'package:flutter/material.dart';
import 'package:languages/addLang.dart';
import "lang.dart";
import "lang_Card.dart";

class LanguageList extends StatefulWidget {
  @override
  _LanguageListState createState() => _LanguageListState();
}

class _LanguageListState extends State<LanguageList> {

  List<Lang> langs = [
    Lang(name: "Tamil", image: "Tamil.jpeg", userAdded: false),
    Lang(name: "Malayalam", image: "Malayalam.jpeg", userAdded: false),
    Lang(name: "Telugu", image: "Telugu.jpeg", userAdded: false),
    Lang(name: "Odia", image: "Odia.png", userAdded: false),
    Lang(name: "Kannada", image: "Kannada.jpeg", userAdded: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Languages"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    "My Languages",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Divider(
                  height: 20,
                  color: Colors.white,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: langs.map((lang) {
                    return LangCard(
                        lang: lang,
                        delete: () {
                          setState(() {
                            langs.remove(lang);
                          });
                        }
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Lang newLang = await Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => AddLang(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = Offset(1.0,0.0);
                var end = Offset.zero;
                var curve = Curves.easeInOut;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
          if (newLang != null) {
            setState(() {
              langs.add(newLang);
            });
          }
        },
        tooltip: 'Add a Language',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.grey[850],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}