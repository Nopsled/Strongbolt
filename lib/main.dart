import 'package:flutter/material.dart';
import 'package:strongbolt/pages/DashboardPage.dart';
import 'package:strongbolt/pages/LoginPage.dart';
import 'package:strongbolt/pages/MyProfilePage.dart';

void main() => runApp(MaterialApp(initialRoute: "/", routes: {
      "/": (context) => LoginPage(),
      "/dashboard": (context) => DashboardPage(),
      "/profile": (context) => MyProfilePage(),
    }));
