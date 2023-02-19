import 'package:tv_maze/core/constants/string_constants.dart';

class StringUtil {
  static String removeAllHtmlTags(String? htmlText) {
    if (htmlText == null) return StringConstants.empty;
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, StringConstants.empty);
  }

  static String formatDateTime(String? date) {
    if (date == null) return StringConstants.empty;
    final dateTime = DateTime.parse(date);
    return '${dateTime.month}/${dateTime.day}/${dateTime.year}';
  }
}
