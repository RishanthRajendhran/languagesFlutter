import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import "lang.dart";
import "dart:async";
import "dart:io";

class AddLang extends StatefulWidget {
  @override
  _AddLangState createState() => _AddLangState();
}

class _AddLangState extends State<AddLang> {

  String _name;
  File _image;
  final _formKey = GlobalKey<FormState>();

  final picker = ImagePicker();

  Future<void> getImage() async {
    var pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {

    if(_image == null) {
      return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text("Add a Language"),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          elevation: 0,
          leading: new IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context,null),
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.words,
                  textAlign: TextAlign.center,
                  maxLength: 15,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[850],
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.white54,
                        ),
                    ),
                    errorBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    hintText: "Language",
                    labelText: "Language",
                    hintStyle: TextStyle(
                      color: Colors.white38,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  validator: (val) {
                    if(val.length==0) {
                      return "Language's name cannot be empty.";
                    }else{
                      return null;
                    }
                  },
                  onChanged: (name) {
                    setState(() {
                      _name = name;
                    });
                  },
                ),
                FlatButton(
                  onPressed: () => getImage(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add_a_photo,
                      ),
                      SizedBox(width: 10,),
                      Text("Add Language Icon"),
                    ],
                  ),
                  color: Colors.grey[850],
                  textColor: Colors.white,
                ),
                SizedBox(height: 100,),
                FlatButton(
                  onPressed: () {
                    if(_formKey.currentState.validate() && _image!=null) {
                      Navigator.pop(context, Lang(name: _name, image: _image.path,userAdded: true));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.save_alt,
                      ),
                      SizedBox(width: 10,),
                      Text("Save Language"),
                    ],
                  ),
                  color: Colors.white,
                  textColor: Colors.grey[900],
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text("Add a Language"),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.words,
                  textAlign: TextAlign.center,
                  maxLength: 15,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[850],
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.white54,
                      ),
                    ),
                    errorBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    hintText: "Language",
                    labelText: "Language",
                    hintStyle: TextStyle(
                      color: Colors.white38,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  validator: (val) {
                    if(val.length==0) {
                      return "Language's name cannot be empty.";
                    }else{
                      return null;
                    }
                  },
                  onChanged: (name) {
                    setState(() {
                      _name = name;
                    });
                  },
                ),
                Image.file(
                    _image,
                  width: 300,
                  height: 300,
                ),
                FlatButton(
                  onPressed: () => getImage(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.photo_camera,
                      ),
                      SizedBox(width: 10,),
                      Text("Change Language Icon"),
                    ],
                  ),
                  color: Colors.grey[850],
                  textColor: Colors.white,
                ),
                SizedBox(height: 100,),
                FlatButton(
                  onPressed: () {
                    if(_formKey.currentState.validate() && _image!=null) {
                        Navigator.pop(context, Lang(name: _name, image: _image.path,userAdded: true));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.save_alt,
                      ),
                      SizedBox(width: 10,),
                      Text("Save Language"),
                    ],
                  ),
                  color: Colors.white,
                  textColor: Colors.grey[900],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
