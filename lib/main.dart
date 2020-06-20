import 'userscreen.dart';

import 'feeds.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FeedsPage(),
      
    );
  }
}

// class MyHomePage extends StatefulWidget {
  
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
  
//   @override
//   Widget build(BuildContext context) {
//   return Scaffold(
//       appBar: AppBar(
//        title: Text('DEMO'),
//        backgroundColor: Colors.blue,
//       ),
//       body: Center(
//         child: Text('Hello'),
//         ),
//     );
//   }
// }
