import 'package:flutter/material.dart';
import "lang.dart";

class LangCard extends StatefulWidget {

  final Lang lang;
  final Function delete;
  LangCard({this.lang,this.delete});

  @override
  _LangCardState createState() => _LangCardState();
}

class _LangCardState extends State<LangCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage((widget.lang.userAdded == false)?"assets/${widget.lang.image}":"${widget.lang.image}"),
                    radius: 50,
                  ),
                  SizedBox(width:30,),
                  Text(
                    "${widget.lang.name}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.lang.isFav = !widget.lang.isFav;
                      });
                    },
                    tooltip: 'Favourite',
                    icon: widget.lang.isFav?Icon(Icons.favorite):Icon(Icons.favorite_border),
                    color: Colors.red,
                  ),
                  IconButton(
                    onPressed: widget.delete,
                    tooltip: "Delete",
                    icon: Icon(Icons.delete_outline),
                    color: Colors.grey,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}