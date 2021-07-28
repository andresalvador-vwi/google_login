import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserPage extends StatefulWidget {
  final GoogleSignInAccount user;
  const UserPage(this.user);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('user'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            title: Text(widget.user.displayName ?? ''),
            subtitle: Text(widget.user.id),
          ),
          const Text("Signed in successfully."),
        ],
      ),
    );
  }
}