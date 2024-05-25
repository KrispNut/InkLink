import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class File_Storage {
  static const String _imageKey = 'saved_image';

  // Store the file path of the saved image
  static Future<void> saveImagePath(String imagePath) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_imageKey, imagePath);
  }

  // Retrieve the file path of the saved image
  static Future<String?> getSavedImagePath() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_imageKey);
  }
}
