import 'package:flutter/material.dart';

/// Models:

/// Screens:
import 'package:chat_app/screens/root/root.dart';
import 'package:chat_app/screens/home/home_screen.dart';
import 'package:chat_app/screens/login/login_screen.dart';

/// Widgets:

/// Services:

/// State:

/// Utils/Helpers:
import 'package:beamer/beamer.dart';

/// Entry Point:
final appRoutes = SimpleLocationBuilder(
  routes: {
    '/': (context, state) => BeamPage(
      key: ValueKey('Root'),
      child: RootCheck()
    ),

    '/login': (context, state) => BeamPage(
      key: ValueKey('Login'),
      child: LoginScreen()
    ),

    '/home': (context, state) => BeamPage(
      key: ValueKey('Home'),
      child: HomeScreen()
    ),
  },
);
