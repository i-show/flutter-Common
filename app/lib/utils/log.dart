import 'dart:developer';

class Log {

  static void d(String tag, String msg) {
    log(msg, name: tag);
  }
}
