import 'package:flutter/material.dart';
import 'package:flutter_jetcaster/provider/provider.dart';
import 'package:flutter_jetcaster/ui/home.dart';
import 'package:provider/provider.dart';


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
      ),
      home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => CasterProvider())
          ],
        child: Home(),
      ),
    );
  }
}
