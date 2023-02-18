import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tv_maze/core/interfaces/safe_bloc.dart';
import 'package:tv_maze/core/state/focus_detector.dart';

abstract class SafeState<V extends StatefulWidget, C extends SafeController>
    extends State<V> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  static T get<T extends Object>({T? defaultValue}) {
    return Modular.get<T>(defaultValue: defaultValue);
  }

  late C controller;
  bool isExecuteInit = true;
  bool performFocusActions = false;

  void beforeInit() {}

  @override
  void initState() {
    super.initState();
    controller = SafeState.get<C>();
    beforeInit();
    if (isExecuteInit) {
      Future.delayed(Duration.zero, () async {
        await controller.init();
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => performFocusActions = true,
        );
      });
    } else {
      performFocusActions = true;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FocusDetector(
      onFocusGained: () {
        if (performFocusActions) {
          controller.onFocusGained();
        }
      },
      onFocusLost: () {
        if (performFocusActions) {
          controller.onFocusLost();
        }
      },
      onForegroundGained: () {
        if (performFocusActions) {
          controller.onForegroundGained();
        }
      },
      onForegroundLost: () {
        if (performFocusActions) {
          controller.onForegroundLost();
        }
      },
      onVisibilityGained: () {
        if (performFocusActions) {
          controller.onVisibilityGained();
        }
      },
      onVisibilityLost: () {
        if (performFocusActions) {
          controller.onVisibilityLost();
        }
      },
      child: buildDetector(context),
    );
  }

  Widget buildDetector(BuildContext context) {
    return super.build(context);
  }
}
