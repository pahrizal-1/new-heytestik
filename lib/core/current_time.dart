import 'package:intl/intl.dart';

class CurrentTime {
  DateTime datetime = DateTime.now();

  String timeNow() {
    String tdata = DateFormat('HH:mm').format(datetime);
    print('jam sekarang $tdata');
    return tdata;
  }

  static String getFirstTime(String value) {
    if (value.isEmpty || value == '' || value == '-') {
      print('-');
      return '-';
    }
    value = value.toString().substring(0, 5);
    print('awal $value');
    return value;
  }

  static String getLastTime(String value) {
    if (value.isEmpty || value == '' || value == '-') {
      print('-');
      return '-';
    }
    value = value.toString().substring(value.length - 5);
    print('akhir $value');
    return value;
  }

  static timeChat(String value) {
    print('heheh $value');
    final DateTime now = DateTime.parse(value);
    final DateFormat formatter = DateFormat('HH:mm');
    final String formatted = formatter.format(now);
    print('heheh $formatted');

    return formatted;
  }
}
