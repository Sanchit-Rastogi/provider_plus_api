import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/Provider/apidata_provider.dart';
import 'package:provider_api/Screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApiData(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
