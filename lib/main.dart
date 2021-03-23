import 'package:flutter/material.dart';
import 'package:phone_auth/Authentication.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Connection",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: StreamBuilder(
        // stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, userSnapsort) {
          // if (userSnapsort.hasData) {
          // return HomeView();
          // } else {
          return Authentication();
          // }
        },
      ),
    );
  }
}
