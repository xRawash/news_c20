import 'package:flutter/material.dart';
import 'package:news/main_layout/main_screen.dart';

class RoutesManager {
  static const String mainLayout = '/mainLayout';


  static Route? getRoute(RouteSettings settings) {
    switch(settings.name){
      case mainLayout:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      default:
        return null;
    }
  }
}