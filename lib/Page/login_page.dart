import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googlelogin/Page/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'https://www.googleapis.com/auth/userinfo.profile',
      'https://www.googleapis.com/auth/cloud-platform',
      'https://www.googleapis.com/auth/userinfo.email'
    ]
  );

  Future<void> googleSignIn(BuildContext context) async {
    try {
      GoogleSignInAccount? _currentUser = await _googleSignIn.signIn();
      //Variavel que pega o ID_token e o Token de acesso
      GoogleSignInAuthentication authentication = await _currentUser!.authentication;
      validarToken(authentication.idToken!);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_)=> UserPage(_currentUser))
      );
    } catch (error) {
      print('caiu aqui');
      print(error);
    }
  }

  Future<void> validarToken(String idtoken) async {
    try {
      Response response = await Dio().get('https://oauth2.googleapis.com/tokeninfo?id_token=$idtoken');
      print('/////////////////////////////');
      print(response.data);
      
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: ()=>googleSignIn(context), 
              child: Text('Login com o Google')
            ),
          )
        ],
      ),
      
    );
  }
}