import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:udemy_futter_course/shared/bloc_observer.dart';

import 'layouts/home_layout.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeLayout(),
      debugShowCheckedModeBanner: false,
    );
  }
}
