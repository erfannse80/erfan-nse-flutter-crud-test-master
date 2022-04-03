// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_see_text.dart';

void main() {
  group('''Login''', () {
    testWidgets('''see the login page''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeText(tester, 'hello Again');
    });
  });
}
