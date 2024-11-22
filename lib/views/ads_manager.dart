import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:news_pro/config/ad_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdsManager {
  static const String checkMessages = 'checkMessagesKey';
  static Future<void> initSaveIntToPrefs(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }
}