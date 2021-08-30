import 'package:flutter/material.dart';

/// Models:

/// Screens:
import 'package:chat_app/screens/home/home_screen.dart';
import 'package:chat_app/screens/login/login_screen.dart';

/// Widgets:

/// Services:
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/services/auth.dart';
import 'package:beamer/beamer.dart';

/// State:

/// Utils/Helpers:

/// Entry Point:
class RootCheck extends StatelessWidget {
  const RootCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return const Scaffold(
            body: Center(
              child: Text("Error"),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return RootChanges();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class RootChanges extends StatefulWidget {
  const RootChanges({Key? key}) : super(key: key);

  @override
  _RootChangesState createState() => _RootChangesState();
}

class _RootChangesState extends State<RootChanges> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth(auth: _auth).user,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          print(snapshot.data);

          // If user's Id == null, go to Login Page, otherwise Home:
          if (snapshot.data?.uid == null) {
            return LoginScreen();
          } else {
            return HomeScreen();
          }
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
