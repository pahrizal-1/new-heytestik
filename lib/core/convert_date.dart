import 'package:intl/intl.dart';

class ConvertDate {
  static String defaultDate(String value) {
    if (value.isEmpty || value == '' || value == '-') return '-';
    DateTime tdata = DateTime.parse(value);
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    final String formatted = formatter.format(tdata);
    return formatted;
  }

  static String transactionDate(String value) {
    if (value.isEmpty || value == '' || value == '-') return '-';
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

  static String dayOnly(String value) {
    if (value.isEmpty || value == '' || value == '-') return '-';
    DateTime tdata = DateTime.parse(value);
    final DateFormat formatter = DateFormat('EEEE');
    final String formatted = formatter.format(tdata);
    return formatted;
  }

  static String normalDate(String value) {
    if (value.isEmpty || value == '' || value == '-') return '-';
    DateTime tdata = DateTime.parse(value);
    var day = DateFormat('EEEE').format(tdata);
    var hari = day;
    // switch (day) {
    //   case 'Sunday':
    //     {
    //       hari = 'Minggu';
    //     }
    //     break;
    //   case 'Monday':
    //     {
    //       hari = 'Senin';
    //     }
    //     break;
    //   case 'Tuesday':
    //     {
    //       hari = 'Selasa';
    //     }
    //     break;
    //   case 'Wednesday':
    //     {
    //       hari = 'Rabu';
    //     }
    //     break;
    //   case 'Thursday':
    //     {
    //       hari = 'Kamis';
    //     }
    //     break;
    //   case 'Friday':
    //     {
    //       hari = 'Jumat';
    //     }
    //     break;
    //   case 'Saturday':
    //     {
    //       hari = 'Sabtu';
    //     }
    //     break;
    // }

    // 'Sabtu, 13 Mei 2023  17:12 WIB',
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    final String formatted = formatter.format(tdata);
    return '$hari, $formatted';
  }

  static String payBefore(String value) {
    if (value.isEmpty || value == '' || value == '-') return '-';
    DateTime tdata = DateTime.parse(value);
    // '13 Mei, 17:12',
    // print('tdata $tdata');
    final DateFormat formatter = DateFormat('dd MMM, HH:mm:ss');
    // print('formatter $formatter');
    final String formatted = formatter.format(tdata);
    // print('formatted $formatted');
    return formatted;
  }

  static String schedule(String value) {
    if (value.isEmpty || value == '' || value == '-') return '-';
    DateTime tdata = DateTime.parse(value);
    // '13 Mei, 17:12',
    // print('tdata $tdata');
    final DateFormat formatter = DateFormat('HH:mm');
    // print('formatter $formatter');
    final String formatted = formatter.format(tdata);
    // print('formatted $formatted');
    return formatted;
  }
}
