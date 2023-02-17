import 'package:tv_maze/core/constants/double_constants.dart';
import 'package:tv_maze/core/constants/int_constants.dart';
import 'package:tv_maze/core/constants/string_constants.dart';

extension GeneralExtentions<T> on T? {
  T get orDefault {
    final value = this;
    if (value == null) {
      return {
        int: IntConstants.empty,
        double: DoubleConstants.empty,
        String: StringConstants.empty,
        bool: false,
        List: [],
        Map: {},
      }[T] as T;
    }
    return value;
  }
}
