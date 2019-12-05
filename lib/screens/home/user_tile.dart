import 'package:air_buddies/models/EachUser.dart';
import 'package:air_buddies/screens/home/detail_page.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {

  final EachUser eachuser;
  UserTile({ this.eachuser });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            // decoration: BoxDecoration(color: Color.fromRGBO(100, 100, 100, .9)),

            child:ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Icon(Icons.account_circle, color: Colors.white),
          ),
          title: Text(
            eachuser.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    // tag: 'hero',
                    child: Text(eachuser.gender,
                        style: TextStyle(color: Colors.white)),
                  )),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(eachuser.age,
                        style: TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(eachuser: eachuser)));
          },
        ),
        ),
        ),

    );
  }
}