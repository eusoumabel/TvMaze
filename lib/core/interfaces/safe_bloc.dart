import 'package:tv_maze/core/util/safe_log_util.dart';

abstract class SafeController extends SafeLog {
  Future<void> init();

  Future<void> dispose();

  void onFocusGained() {}

  void onFocusLost() {}

  void onVisibilityGained() {}

  void onVisibilityLost() {}

  void onForegroundGained() {}

  void onForegroundLost() {}
}
