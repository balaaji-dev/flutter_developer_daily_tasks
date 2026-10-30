import 'package:flutter/material.dart';
import 'package:flutter_developer_daily_tasks/form_demo/main.dart';
import 'package:flutter_developer_daily_tasks/screens/registration_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rgistration App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const RegistrationScreen(),
    );
  }
}


