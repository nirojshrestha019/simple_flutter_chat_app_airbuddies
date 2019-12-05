import 'package:air_buddies/models/user.dart';
import 'package:air_buddies/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:air_buddies/services/auth.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
          child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}  