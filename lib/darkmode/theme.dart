import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    // useMaterial3: false, for older version
    // appBarTheme: AppBarTheme(
    //   backgroundColor: Colors.blue,
    //   titleTextStyle: TextStyle(
    //     color: Colors.white, // Title text color
    //     fontSize: 25,
    //     fontWeight: FontWeight.bold,
    //   ),
    // ),
  );

  static final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    useMaterial3: false,
    // appBarTheme: AppBarTheme(
    //   backgroundColor: Colors.white.withOpacity(0.2),
    //   titleTextStyle: TextStyle(
    //     color: Colors.blue, // Title text color
    //     fontSize: 25,
    //     fontWeight: FontWeight.bold,
    //   ),
    // ),
  );

  void toggleTheme(bool isDark) {
    emit(isDark ? _darkTheme : _lightTheme);
  }
}
