import 'dart:math';

import 'package:flutter/material.dart';
import 'package:slide_drawer/slide_drawer.dart';
import 'package:untitled3/second_page.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey ,
      home: SlideDrawer(
        backgroundColor: Colors.green.withOpacity(0.7),
        offsetFromRight: 300,
        rotateAngle: pi/5,
        duration: Duration(milliseconds: 3200),
        items: [
          MenuItem('Home',
              onTap: (){},
              icon: Icons.account_balance),
          MenuItem('Second Page',
              onTap: (){
             navigatorKey.currentState!.push(MaterialPageRoute(builder: (context)=>SecondPage()));
              },
            icon: Icons.add_to_photos_outlined ),
          MenuItem('Favourite',
              onTap: (){},
              icon: Icons.workspaces_filled ),
          MenuItem('Profile', onTap: (){}),
          MenuItem('Setting', onTap: (){}),
        ],
        child: MyHomePage(),
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get icon => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: Text("My App"),
        leading: IconButton(
            onPressed: () => SlideDrawer.of(context)!.toggle(),
            icon: Icon(Icons.menu_outlined)
        ),
      ),
    );
  }
}

