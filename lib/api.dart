import 'package:flutter/material.dart';
import 'package:myflutterapp/screens/splashscreen.dart';

class Api extends StatefulWidget {
  const Api({Key? key}) : super(key: key);

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        appBar: AppBar(title:
        Text("My Books",), backgroundColor: Colors.orange[300],),
          body: SafeArea(
            child:MaterialApp(
             theme: ThemeData(
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.black.withOpacity(0))
             ),
          debugShowCheckedModeBanner: false,
          title: 'Books App',
              home: splashscreen(),
      ),
    ),

    );
  }
}
