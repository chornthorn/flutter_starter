import 'package:flutter/material.dart';

class Globals {
  static final String defaultLanguage = 'en';
//List of languages that are supported.  Used in selector.
//Follow this plugin for translating a google sheet to languages
//https://github.com/aloisdeniel/flutter_sheet_localization
//Flutter App translations google sheet
//https://docs.google.com/spreadsheets/d/1oS7iJ6ocrZBA53SxRfKF0CG9HAaXeKtzvsTBhgG4Zzk/edit?usp=sharing

  static final List<MenuOptionsModel> languageOptions = [
    MenuOptionsModel(key: "en", value: "English"), //English
    MenuOptionsModel(key: "km", value: "Khmer"), //Khmer
  ];
}

// Model class to hold menu option data (language and theme)
class MenuOptionsModel {
  final String key;
  final String value;
  final IconData? icon;

  MenuOptionsModel({required this.key, required this.value, this.icon});
}
