import 'package:air_buddies/models/EachUser.dart';
import 'package:flutter/material.dart';
import 'package:air_buddies/screens/home/chat.dart';


class DetailPage extends StatelessWidget {

  final EachUser eachuser;
  DetailPage({Key key, this.eachuser}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final topdetailText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>
      [
        SizedBox(height: 120.0),
        Icon(
          Icons.flight,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          eachuser.name,
          style: TextStyle(color: Colors.white, fontSize: 35.0),
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 1, child: Text(
                      eachuser.gender,
                      style: TextStyle(color: Colors.white),
                    )),
            Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      eachuser.age,
                      style: TextStyle(color: Colors.white),
                    ))),
                    
          ],
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 1, child: Text(
                      eachuser.transit_at,
                      style: TextStyle(color: Colors.white),
                    )),
            Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      eachuser.date,
                      style: TextStyle(color: Colors.white),
                    ))),
                    
          ],
        )
      ],
    );

    final topdetail = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('assets/blank-profile-picture.png'),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topdetailText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomdetailText = Text(
      eachuser.detail,
      style: TextStyle(fontSize: 18.0),
    );
    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Chat(eachuser: eachuser))),
          },
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child:
              Text("Start Chating", style: TextStyle(color: Colors.white)),
        ));
    final bottomdetail = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomdetailText, readButton],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[topdetail, bottomdetail],
      ),
    );
  }
}