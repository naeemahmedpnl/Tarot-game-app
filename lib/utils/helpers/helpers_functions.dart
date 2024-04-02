import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TarotHelperFunc {
  static Color getColor(String value) {
    switch (value) {
      case 'Green':
        return Colors.green;
      case 'Red':
        return Colors.red;
      case 'Blue':
        return Colors.blue;
      case 'Pink':
        return Colors.pink;
      case 'Grey':
        return Colors.grey;
      case 'Purple':
        return Colors.purple;
      case 'Yellow':
        return Colors.yellow;
      case 'Orange':
        return Colors.orange;
      case 'Teal':
        return Colors.teal;
      case 'Cyan':
        return Colors.cyan;
      case 'Amber':
        return Colors.amber;
      case 'Brown':
        return Colors.brown;
      case 'DeepOrange':
        return Colors.deepOrange;
      case 'Indigo':
        return Colors.indigo;
      case 'Lime':
        return Colors.lime;
      case 'DeepPurple':
        return Colors.deepPurple;
      case 'LightBlue':
        return Colors.lightBlue;
      case 'LightGreen':
        return Colors.lightGreen;
      case 'OrangeAccent':
        return Colors.orangeAccent;
      case 'LightGreenAccent':
        return Colors.lightGreenAccent;
      case 'BlueGrey':
        return Colors.blueGrey;
      case 'AmberAccent':
        return Colors.amberAccent;
      case 'LimeAccent':
        return Colors.limeAccent;
      case 'TealAccent':
        return Colors.tealAccent;
      case 'CyanAccent':
        return Colors.cyanAccent;
      case 'DeepOrangeAccent':
        return Colors.deepOrangeAccent;
      case 'IndigoAccent':
        return Colors.indigoAccent;
      case 'PinkAccent':
        return Colors.pinkAccent;
      case 'PurpleAccent':
        return Colors.purpleAccent;
      default:
        return Colors.black;
    }
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showAlert(String title, String message) {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}
