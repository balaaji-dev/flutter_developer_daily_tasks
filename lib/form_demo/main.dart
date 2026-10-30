import 'package:flutter/material.dart';
import 'package:flutter_developer_daily_tasks/main.dart';
import 'from_signup.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key : key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'signup',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SignUp(),

    );
  }
}
