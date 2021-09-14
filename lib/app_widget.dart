import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_mobile/core/app_colors.dart';
import 'package:teste_mobile/features/presenter/home/home_page.dart';

import 'core/app_gradients.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.red
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ).modular();
  }
}
