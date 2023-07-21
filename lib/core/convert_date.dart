import 'package:intl/intl.dart';

class ConverDate {
  static String defaultDate(String value) {
    DateTime tdata = DateTime.parse(value);
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    final String formatted = formatter.format(tdata);
    return formatted;
  }
}
