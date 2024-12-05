import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecognitionHistoryItem {
  final DateTime dateTime;
  final String result;

  RecognitionHistoryItem({required this.dateTime, required this.result});
}

class AppState with ChangeNotifier {
  final List<RecognitionHistoryItem> _historyItems = [];
  SharedPreferences? _prefs;

  List<RecognitionHistoryItem> get historyItems => _historyItems;

  // Initialize SharedPreferences when the app starts
  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    loadHistoryFromPrefs();
  }

  // Load history items from SharedPreferences
  void loadHistoryFromPrefs() {
    final historyJsonList = _prefs?.getStringList('history') ?? [];
    final historyItems = historyJsonList.map((json) {
      final Map<String, dynamic> itemMap = jsonDecode(json);
      return RecognitionHistoryItem(
        dateTime: DateTime.parse(itemMap['dateTime']),
        result: itemMap['result'],
      );
    }).toList();
    _historyItems.addAll(historyItems);
    notifyListeners();
  }

  // Save history items to SharedPreferences
  void saveHistoryToPrefs() {
    final historyJsonList = _historyItems.map((item) {
      final itemMap = {
        'dateTime': item.dateTime.toIso8601String(),
        'result': item.result,
      };
      return jsonEncode(itemMap);
    }).toList();
    _prefs?.setStringList('history', historyJsonList);
  }

  // Add a new history item and save to SharedPreferences
  void updateHistory(DateTime dateTime, String result) {
    final newItem = RecognitionHistoryItem(dateTime: dateTime, result: result);
    _historyItems.add(newItem);
    saveHistoryToPrefs();
    notifyListeners();
  }

  // Clear history items
  void clearHistory() {
    _historyItems.clear();
    saveHistoryToPrefs();
    notifyListeners();
  }
}
