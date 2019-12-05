import 'package:air_buddies/models/user.dart';
import 'package:air_buddies/screens/authenticate/authenticate.dart';
import 'package:air_buddies/screens/home/home.dart';
import "package:provider/provider.dart";
import 'package:flutter/material.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    final user = Provider.of<User>(context);


    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();    
    }
    else {
      return Home();
    }
  }
}