import 'package:intl/intl.dart';

class ConvertDate {
  static String defaultDate(String value) {
    DateTime tdata = DateTime.parse(value);
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    final String formatted = formatter.format(tdata);
    return formatted;
  }

  static String transactionDate(String value) {
    DateTime tdata = DateTime.parse(value);
    var day = DateFormat('EEEE').format(tdata);
    var hari = '';
    switch (day) {
      case 'Sunday':
        {
          hari = 'Minggu';
        }
        break;
      case 'Monday':
        {
          hari = 'Senin';
        }
        break;
      case 'Tuesday':
        {
          hari = 'Selasa';
        }
        break;
      case 'Wednesday':
        {
          hari = 'Rabu';
        }
        break;
      case 'Thursday':
        {
          hari = 'Kamis';
        }
        break;
      case 'Friday':
        {
          hari = 'Jumat';
        }
        break;
      case 'Saturday':
        {
          hari = 'Sabtu';
        }
        break;
    }

    // 'Sabtu, 13 Mei 2023  17:12 WIB',
    final DateFormat formatter = DateFormat('dd MMM yyyy HH:mm');
    final String formatted = formatter.format(tdata);
    return '$hari, $formatted WIB';
  }
}
