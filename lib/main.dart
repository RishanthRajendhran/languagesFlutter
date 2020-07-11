import 'package:flutter/material.dart';
import "langList.dart";
import "addLang.dart";

void main() {
  runApp(MaterialApp(
    routes: {
      "/" : (context) => LanguageList(),
      "/addlang": (context) => AddLang(),
    },
  ));
}




