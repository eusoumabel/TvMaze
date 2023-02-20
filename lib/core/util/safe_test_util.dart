export 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';
import 'package:tv_maze/core/util/safe_log_util.dart';
export 'package:mocktail/mocktail.dart';

import 'package:tv_maze/core/util/safe_test_util.dart';

enum TypeTest { success, error, empty, others }

abstract class SafeTest extends SafeLog {
  late List<dynamic> listFallBack;

  SafeTest() {
    listFallBack = [];
  }

  void runTests();

  @isTestGroup
  void safeGroup({
    required String description,
    required void Function() body,
    dynamic skip,
  }) {
    group(description, body, skip: skip);
  }

  @isTest
  void safeTest({
    required TypeTest type,
    required String given,
    required String when,
    required String then,
    required dynamic Function() body,
    String? testOn,
    String? skip,
  }) {
    assert(
      given.length > 10 && when.length > 10 && then.length > 10,
      'not enough information to describe the test',
    );
    final description = '\n$given \n$when \n$then';
    test(
      description,
      () {
        return body();
      },
      testOn: testOn,
      timeout: Timeout.none,
      skip: skip,
    );
  }

  void safeRegisterListFallBack({required List<dynamic> listValue}) {
    setUpAll(() {
      for (final value in listValue) {
        registerFallbackValue(value);
      }
    });
  }
}
