import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final int milliseconds;
  final VoidCallback? action;
  Timer? _timer;

  Debouncer({
    this.milliseconds = 500,
    this.action,
  });

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
