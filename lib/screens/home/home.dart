import 'package:air_buddies/models/EachUser.dart';
import 'package:air_buddies/screens/home/user_list.dart';
import 'package:air_buddies/screens/home/settings_form.dart';
import 'package:air_buddies/services/auth.dart';
import 'package:air_buddies/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<EachUser>>.value(
      value: DatabaseService().users,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: Text('Air Buddies'),
          backgroundColor: Colors.grey[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/plane.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: UserList()
        ),
      ),
    );
  }
}