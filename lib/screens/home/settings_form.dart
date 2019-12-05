import 'package:air_buddies/models/user.dart';
import 'package:air_buddies/services/database.dart';
import 'package:air_buddies/shared/constants.dart';
import 'package:air_buddies/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();

  String _currentName;
  String _currentGender;
  String _currentAge;
  String _currentDetail;
  String _currentTransitAt;
  String _currentDate;

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData userData = snapshot.data;
          return new Scaffold(
            body: new Container(
              child: new Form(
            key: _formKey,
            child: new ListView(
              children: <Widget>[
                Text(
                  'Update your profile settings.',
                  style: TextStyle(fontSize: 10.0),
                ),
                SizedBox(height: 6.0),
                TextFormField(
                  initialValue: userData.name,
                  decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 2.0),),  hintText: 'Enter your name'),
                  validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                  onChanged: (val) => setState(() => _currentName = val),
                ),
                SizedBox(height: 6.0),
                TextFormField(
                  initialValue: userData.gender,
                  decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 2.0),),  hintText: 'Enter your gender'),
                  validator: (val) => val.isEmpty ? 'Please enter a gender' : null,
                  onChanged: (val) => setState(() => _currentGender = val),
                ),
                SizedBox(height: 6.0),
                TextFormField(
                  initialValue: userData.age,
                  decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 2.0),),  hintText: 'Enter your age'),
                  validator: (val) => val.isEmpty ? 'Please enter a age' : null,
                  onChanged: (val) => setState(() => _currentAge = val),
                ),
                SizedBox(height: 6.0),
                TextFormField(
                  initialValue: userData.detail,
                  decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 2.0),),  hintText: 'Enter your bio'),
                  validator: (val) => val.isEmpty ? 'Please enter details' : null,
                  onChanged: (val) => setState(() => _currentDetail = val),
                ),
                SizedBox(height: 6.0),
                TextFormField(
                  initialValue: userData.transit_at,
                  decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 2.0),),  hintText: 'Enter transit airport name'),
                  validator: (val) => val.isEmpty ? 'Please enter name of transit' : null,
                  onChanged: (val) => setState(() => _currentTransitAt = val),
                ),
                 SizedBox(height: 6.0),
                TextFormField(
                  initialValue: userData.date,
                  decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 2.0),),  hintText: 'Date of Transit YYYY-MM-DD'),
                  validator: (val) => val.isEmpty ? 'Please enter date of transit' : null,
                  onChanged: (val) => setState(() => _currentDate = val),
                ),
                RaisedButton(
                  color: Colors.blue[400],
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      await DatabaseService(uid: user.uid).updateUserData(
                        _currentName ?? snapshot.data.name, 
                        _currentGender ?? snapshot.data.gender, 
                        _currentAge ?? snapshot.data.age,
                        _currentDetail ?? snapshot.data.detail, 
                        _currentTransitAt ?? snapshot.data.transit_at, 
                        _currentDate ?? snapshot.data.date
                      );
                      Navigator.pop(context);
                    }
                  }
                ),
              ],
            ),
          ),
                ),
            resizeToAvoidBottomPadding: true,
          );
        } else {
          return Loading();
        }
      }
    );
  }
}