import 'package:cs_quiz/provider/google_sign_in.dart';
import 'package:cs_quiz/ui/pages/google_signin_page.dart';
import 'package:cs_quiz/ui/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quizzler"),
        actions: [
          TextButton.icon(
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GoogleSignIn()));
              },
              icon: Icon(Icons.logout_rounded),
              label: Text("LogOut")),
        ],
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              height: 400,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(user?.photoURL ?? ""),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Heyy!!!",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  user?.displayName ?? "",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  user?.email ?? "",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.indigo[300]),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(15)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  child: Text(
                    "<Let's Play/>",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                Image.asset("assets/images/image.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
