import 'package:cs_quiz/ui/pages/google_signin_page.dart';
import 'package:cs_quiz/ui/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthState extends StatelessWidget {
  const AuthState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return HomePage();
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Something went wrong"),
            );
          } else {
            return GoogleSignIn();
          }
        },
      ),
    );
  }
}
