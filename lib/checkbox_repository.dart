import 'package:shared_preferences/shared_preferences.dart';

class CheckBoxRepository {
  Future<Map<String, bool>> getCheckData() async {
    final prefs = await SharedPreferences.getInstance();
    bool morning_check = prefs.getBool("morning") ?? false;
    bool afternoon_check = prefs.getBool("afternoon") ?? false;
    bool night_check = prefs.getBool("night") ?? false;

    return Future<Map<String, bool>>.value({
      "morning": morning_check,
      "afternoon": afternoon_check,
      "night": night_check
    });
  }

  void saveCheckData(
      bool morning_check, bool afternoon_check, bool night_check) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("morning", morning_check);
    prefs.setBool("afternoon", afternoon_check);
    prefs.setBool("night", night_check);
  }
}
