import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/main.dart';
import 'package:mc_crud_test/ui/login_screen/login_screen.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(
    home: LoginScreen(),
  ));
}
