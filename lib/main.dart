import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tazkiyah/routing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Routing.prefs = prefs;
  runApp(MaterialApp.router(
      routerConfig: Routing.router,
      debugShowCheckedModeBanner: false,
    ),
  );
}
