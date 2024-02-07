import 'package:flutter/cupertino.dart';
import 'package:student_info/screen/home/home_screen.dart';
import 'package:student_info/screen/splesh/splesh_screen.dart';

Map <String,WidgetBuilder> myRouts={
  "/":(context) => const SpleshScreen_(),
  "home":(context) => const HomeScreen(),
};