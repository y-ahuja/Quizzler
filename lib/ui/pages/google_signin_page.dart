import 'package:cs_quiz/provider/google_sign_in.dart';
import 'package:cs_quiz/ui/pages/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class GoogleSignIn extends StatefulWidget {
  static const routeName = "/googleSignInPage";
  const GoogleSignIn({Key? key}) : super(key: key);

  @override
  _GoogleSignInState createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              height: 300,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Text(
                  "Quizzler",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 100),
                Image.asset('assets/images/image.png'),
                SizedBox(height: 100.0),
                ElevatedButton.icon(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(15)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.GoogleLogin();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Start(),
                        ),
                      );
                    },
                    icon: FaIcon(FontAwesomeIcons.google),
                    label: Text("Sign Up with Google")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
