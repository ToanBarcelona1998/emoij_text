import 'dart:developer' as dev;

enum LogType {
  medium,
  low,
  high,
}

class Logger extends Object {
  static void logMessage(String message) {
    dev.log('new message $message',level: 100);
  }

  static void logError(String error,
      [StackTrace? trace, LogType type = LogType.high]) {
    switch (type) {
      case LogType.low:
        dev.log(
          'new error $error',
          stackTrace: trace,
          time: _now,
          level: 1000,
        );
        break;
      case LogType.medium:
        dev.log(
          'new error $error',
          stackTrace: trace,
          time: _now,
          level: 1500,
        );
        break;
      case LogType.high:
        dev.log(
          'new error $error',
          stackTrace: trace,
          time: _now,
          level: 3000,
        );
        break;
    }
  }

  static DateTime get _now => DateTime.now();
}
