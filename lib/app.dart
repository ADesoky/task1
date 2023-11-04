import 'package:flutter/material.dart';
import 'package:task/Features/Home/Views/homelayout.dart';
import 'package:task/Features/Home/Views/homescreen.dart';
import 'package:task/Features/Home/Views/tabs/profile.dart';

import 'Shared/navbar.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Task',
         home: HomeLayout(),
    );
  }
}


