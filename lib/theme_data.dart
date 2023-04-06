import 'package:cassava_proj/constants.dart';
import 'package:flutter/material.dart';

// class Style {
//   static ThemeData themeData(bool isDarkTheme, BuildContext context) {
//     return ThemeData(
//         scaffoldBackgroundColor:
//             isDarkTheme ? kSecondaryColor : kBackgroundColor,
//         primaryColor: Colors.blue,
//         colorScheme: ThemeData().colorScheme.copyWith(
//             secondary: isDarkTheme ? kSecondaryColor : kBackgroundColor),
//         brightness: isDarkTheme ? Brightness.dark : Brightness.light,
//         cardColor: isDarkTheme ? kSecondaryColor : kBackgroundColor,
//         canvasColor: isDarkTheme ? kSecondaryColor : kBackgroundColor,
//         buttonTheme: Theme.of(context).buttonTheme.copyWith(
//             colorScheme: isDarkTheme
//                 ? const ColorScheme.dark()
//                 : const ColorScheme.light()));
//   }
// }
class MyTheme{
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.teal,

  );
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
}
