import 'package:flutter/material.dart';

enum SafeSnackBarTypeEnum {
  active,
  success,
  alert,
  error,
  info,
}

extension SnackBarBackgroundColor on SafeSnackBarTypeEnum {
  Color get background {
    switch (this) {
      case SafeSnackBarTypeEnum.alert:
        return Colors.yellow.shade600;
      case SafeSnackBarTypeEnum.error:
        return Colors.redAccent.shade700;
      case SafeSnackBarTypeEnum.success:
        return Colors.green.shade600;
      case SafeSnackBarTypeEnum.active:
        return const Color(0xFFA9C7FF);
      case SafeSnackBarTypeEnum.info:
        return Colors.grey.shade400;
    }
  }
}

extension ParseToIcon on SafeSnackBarTypeEnum {
  Icon get icon {
    final color = Colors.grey.shade50;
    switch (this) {
      case SafeSnackBarTypeEnum.alert:
        return Icon(Icons.admin_panel_settings_sharp, color: color);
      case SafeSnackBarTypeEnum.error:
        return Icon(Icons.error_outline, color: color);
      case SafeSnackBarTypeEnum.success:
        return Icon(Icons.check_circle_outline, color: color);
      case SafeSnackBarTypeEnum.active:
        return Icon(Icons.thumb_up_alt, color: color);
      case SafeSnackBarTypeEnum.info:
        return Icon(Icons.info_outline, color: color);
    }
  }
}
