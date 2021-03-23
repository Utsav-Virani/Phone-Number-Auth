import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(FirebaseAuth.instance.currentUser.phoneNumber),
            GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                child: Text("Logout"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
