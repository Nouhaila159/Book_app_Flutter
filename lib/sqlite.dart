import 'package:flutter/material.dart';
import 'package:myflutterapp/screens/home_screen.dart';

class Sqlite extends StatefulWidget {
  const Sqlite({Key? key}) : super(key: key);

  @override
  State<Sqlite> createState() => _SqliteState();
}

class _SqliteState extends State<Sqlite> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:
      Text("My favorite Books"), backgroundColor: Colors.orange[300],),
      body: SafeArea(
        child:MaterialApp(
          theme: ThemeData(
              bottomSheetTheme: BottomSheetThemeData(
                  backgroundColor: Colors.black.withOpacity(0))
          ),
          debugShowCheckedModeBanner: false,
          title: 'Books App',
          home: HomeScreen(),
        ),
      ),
    );
  }
}
