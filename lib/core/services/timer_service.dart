import 'dart:async';

import 'package:intl/intl.dart';

class TimerService {
  String getCurrentDay() {
    return DateFormat('EEEE').format(DateTime.now());
  }

  String getTodaysDate() {
    return DateFormat.yMMMMd('en_US').format(DateTime.now());
  }

  Stream<String> getTimeStream() async* {
    DateTime? time;

    while (true) {
      try {
        DateTime currentTime = DateTime.now();
        if (time != currentTime) {
          time = currentTime;
          yield DateFormat('KK:mm a').format(time);
        }
      } catch (e) {
        print(e);
      }
      await Future.delayed(Duration(seconds: 1));
    }
  }
}
