import 'package:flutter/material.dart';
import 'package:app/config/config.dart';
import './app.dart';

void main() {
  Config.env = Env.LOCAL;
  runApp(new MyApp());
}