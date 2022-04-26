import 'package:clean_architecture_ess/application/home_module.dart';
import 'package:clean_architecture_ess/presentation/home.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(homeState: HomeModule.homeState()),
    );
  }
}
