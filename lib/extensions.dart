import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';

extension TextBoxHelper on Text {
  Container get frame {
    return Container(padding: const EdgeInsets.all(25), child: this);
  }

  Container get indent {
    return Container(
        padding: const EdgeInsets.fromLTRB(50, 0, 0, 5), child: this);
  }

  Container get indent2 {
    return Container(
        padding: const EdgeInsets.fromLTRB(100, 0, 0, 5), child: this);
  }

  Container get indent3 {
    return Container(
        padding: const EdgeInsets.fromLTRB(150, 0, 0, 5), child: this);
  }

  Container get indent4 {
    return Container(
        padding: const EdgeInsets.fromLTRB(200, 0, 0, 5), child: this);
  }
}

extension TextStyleHelper on TextStyle? {
  TextStyle? get large {
    return this?.copyWith(fontSize: 100);
  }

  TextStyle? get light {
    return this?.copyWith(color: Colors.white);
  }

  TextStyle? get blue {
    return this?.copyWith(color: Colors.blue);
  }

  TextStyle? get red {
    return this?.copyWith(color: Colors.red);
  }

  TextStyle? get green {
    return this?.copyWith(color: Colors.green);
  }

  TextStyle? get blackbold {
    return this?.copyWith(color: Colors.black, fontWeight: FontWeight.bold);
  }
}

extension TextHelper on BuildContext {
  bool get isDesktop {
    bool wider =
        MediaQuery.of(this).size.height < MediaQuery.of(this).size.width;

    if (!wider || MediaQuery.of(this).size.width < 1000) {
      return false;
    } else if (kIsWeb ||
        Platform.isMacOS ||
        Platform.isLinux ||
        Platform.isWindows) {
      return true;
    }

    return false;
  }

  TextStyle? get h1 {
    return isDesktop
        ? Theme.of(this)
            .textTheme
            .displayMedium
            ?.copyWith(fontSize: 64, fontWeight: FontWeight.bold)
        : Theme.of(this)
            .textTheme
            .displayMedium
            ?.copyWith(fontSize: 34, fontWeight: FontWeight.bold);
  }

  TextStyle? get h2 {
    return isDesktop
        ? Theme.of(this).textTheme.displayMedium
        : Theme.of(this).textTheme.displaySmall?.copyWith(fontSize: 36);
  }

  TextStyle? get h3 {
    return isDesktop
        ? Theme.of(this).textTheme.titleLarge?.copyWith(fontSize: 36)
        : Theme.of(this).textTheme.titleMedium;
  }

  TextStyle? get p {
    return isDesktop
        ? Theme.of(this).textTheme.bodyLarge?.copyWith(fontSize: 24)
        : Theme.of(this).textTheme.bodyMedium;
  }
}

Color hexOrRGBToColor(String colorStr) {
  RegExp hexColorRegex =
      RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6}|[0-9a-fA-F]{8})$');
  if (colorStr.startsWith("rgba")) {
    List rgbaList = colorStr.substring(5, colorStr.length - 1).split(",");
    return Color.fromRGBO(int.parse(rgbaList[0]), int.parse(rgbaList[1]),
        int.parse(rgbaList[2]), double.parse(rgbaList[3]));
  } else if (colorStr.startsWith("rgb")) {
    List rgbList = colorStr
        .substring(4, colorStr.length - 1)
        .split(",")
        .map((c) => int.parse(c))
        .toList();
    return Color.fromRGBO(rgbList[0], rgbList[1], rgbList[2], 1.0);
  } else if (hexColorRegex.hasMatch(colorStr)) {
    if (colorStr.length == 4) {
      colorStr = colorStr + colorStr.substring(1, 4);
    }
    if (colorStr.length == 7) {
      int colorValue = int.parse(colorStr.substring(1), radix: 16);
      return Color(colorValue).withOpacity(1.0);
    } else {
      int colorValue = int.parse(colorStr.substring(1, 7), radix: 16);
      double opacityValue =
          int.parse(colorStr.substring(7), radix: 16).toDouble() / 255;
      return Color(colorValue).withOpacity(opacityValue);
    }
  } else if (colorStr.isEmpty) {
    throw UnsupportedError("Empty color field found.");
  } else if (colorStr == 'none') {
    return Colors.transparent;
  } else {
    throw UnsupportedError(
        "Only hex, rgb, or rgba color format currently supported. String:  $colorStr");
  }
}
