import 'package:flutter/material.dart';
import 'package:myflutterapp/api.dart';
import 'package:myflutterapp/home.dart';
import 'package:myflutterapp/logout.dart';
import 'package:myflutterapp/settings.dart';
import 'package:myflutterapp/sqlite.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future main() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true,
      ),
      routes: {
        "home":(context)=>HomePage(),
        "api":(context)=>Api(),
        "settings":(context)=>Settings(),
        "sqlite":(context)=>Sqlite(),
        "logout":(context)=>Logout(),
      },
    );
  }
}