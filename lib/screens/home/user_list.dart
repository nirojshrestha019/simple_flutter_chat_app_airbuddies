import 'package:flutter/material.dart';
import 'package:air_buddies/models/EachUser.dart';
import 'package:provider/provider.dart';
import 'package:air_buddies/screens/home/user_tile.dart';


class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {

    final users = Provider.of<List<EachUser>>(context)?? [];

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UserTile(eachuser: users[index]);
      },
    );
  }
}