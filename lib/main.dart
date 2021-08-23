import 'package:cs_quiz/provider/google_sign_in.dart';
import 'package:cs_quiz/ui/pages/google_signin_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.indigo,
              accentColor: Colors.blue[700],
              buttonColor: Colors.blue,
              buttonTheme: ButtonThemeData(
                  buttonColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  textTheme: ButtonTextTheme.primary)),
          initialRoute: GoogleSignIn.routeName,
          routes: {
            GoogleSignIn.routeName: (context) => GoogleSignIn(),
          },
        );
      },
    );
  }
}
