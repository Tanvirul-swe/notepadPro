import 'package:intl/intl.dart';
class DateTimeConvertion {
  int datetimeToMilles() {
    final DateTime currentDate = DateTime.now();
    int milles = currentDate.millisecondsSinceEpoch;
    return milles;
  }

  String millesToRealTime(int milles) {
    final DateTime date2 = DateTime.fromMillisecondsSinceEpoch(milles);
    return date2.toString();
  }
    String millesToRealDateOnly(int milles) {
    final DateTime date2 = DateTime.fromMillisecondsSinceEpoch(milles);
      final date = DateFormat.yMd().format(date2);
    return date.toString();
  }
}