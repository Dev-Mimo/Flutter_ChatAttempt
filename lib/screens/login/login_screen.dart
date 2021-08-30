import 'package:flutter/material.dart';

/// Models:

/// Screens:

/// Widgets:

/// Services:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// State:

/// Utils/Helpers:
import 'package:chat_app/utils/responsive_helper.dart';

/// Entry Point:
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ResponsiveHelper(
          mobile: Container(
            child: Text("Login Screen!"),
          ),
          tablet: Container(),
          desktop: Container(),
        ),
      ),
    );
  }
}
