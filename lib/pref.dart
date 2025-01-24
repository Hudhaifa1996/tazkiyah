import 'dart:convert';
import 'package:tazkiyah/routing.dart';

class ListStorage {
  static const String _keyCheckedList = "checked_list";

  // Save the list to SharedPreferences
  static Future<void> saveCheckedList(List<List<bool>> checked) async {
    // Convert the list to a JSON string
    String jsonString = jsonEncode(checked);
    await Routing.prefs.setString(_keyCheckedList, jsonString);
  }

  // Load the list from SharedPreferences
  static Future<List<List<bool>>> loadCheckedList() async {
    String? jsonString = Routing.prefs.getString(_keyCheckedList);

    if (jsonString == null) {
      return List.generate(30, (_) => List.generate(23, (_) => false));
    }

    // Convert the JSON string back to a List<List<bool>>
    List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map<List<bool>>((row) => List<bool>.from(row)).toList();
  }

  void saveIntegers(String name, int integer) {
    Routing.prefs.setInt(name, integer);
  }

  Future<int?> loadIntegers(String name) async {
    return Routing.prefs.getInt(name) ?? 1;
  }

  void saveString(String name, String data) {
    Routing.prefs.setString(name, data);
  }

  Future<String> loadString(String name) async {
    return Routing.prefs.getString(name) ?? "0";
  }
}
