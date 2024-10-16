import 'package:flutter/material.dart';


import '../screen/home/view/home_screen.dart';
import '../screen/native/view/native_screen.dart';

Map<String,WidgetBuilder>app_routes={
  "/":(c1)=>const HomeScreen(),
  "/native":(c1)=>const NativeScreen(),
};