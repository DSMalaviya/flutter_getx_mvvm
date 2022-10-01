import 'dart:developer';

import 'package:flutter_application_architect/core/values/enums.dart';

printlog({LogColor? color, required String message, String? name}) {
  if (color == null) {
    log(message, name: "");
    return;
  }
  String colorCode = getAnsiColorCode(color);
  log("$colorCode$message\x1B[0m", name: name ?? "");
}

String getAnsiColorCode(LogColor color) {
  switch (color) {
    case LogColor.white:
      return "\x1B[37m";
    case LogColor.red:
      return "\x1B[31m";
    case LogColor.yellow:
      return "\x1B[33m";
    case LogColor.green:
      return "\x1B[32m";
    case LogColor.blue:
      return "\x1B[34m";
    case LogColor.cyan:
      return "\x1B[36m";
    case LogColor.magenta:
      return "\x1B[35m";
    default:
      return "\x1B[34m";
  }
}
