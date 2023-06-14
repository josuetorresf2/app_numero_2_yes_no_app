import 'package:flutter/material.dart';

const Color _customColor = Color(0XFF49149f); //_ this makes it private

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
]; //_ solo se pueden usar en este archivo

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0 //or required
      })
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'index of color must be between 0 and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
