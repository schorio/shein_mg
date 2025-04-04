import 'package:flutter/material.dart';
import 'package:shein_mg_app/route/app_route.dart';
import 'package:shein_mg_app/route/app_route_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shein MG',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouteName.home,
      onGenerateRoute: AppRoute.generate,
    );

  }
}
