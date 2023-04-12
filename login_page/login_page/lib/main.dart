import 'package:flutter/material.dart';
import 'package:login_page/injection/injection.dart';

import './app/app.dart';

void main() async {
  await initGetIt();
  runApp(MyApp());
}
