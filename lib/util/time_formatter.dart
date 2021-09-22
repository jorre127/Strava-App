import 'package:intl/intl.dart';

class TimeFormatter {
  static String format(int time) {
    final minutes = Duration(seconds: time).inMinutes;
    final hours = Duration(seconds: time).inHours;

    if (hours.round() != 0) {
      return '${hours}h ${minutes - Duration(hours: hours).inMinutes}m';
    } else {
      return '${minutes}m ${time - Duration(minutes: minutes).inSeconds}s';
    }
  }
}
