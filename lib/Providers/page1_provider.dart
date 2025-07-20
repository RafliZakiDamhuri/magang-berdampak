import 'package:flutter/material.dart';

class Page1Provider with ChangeNotifier {
  bool isPalindrome = false;
  Future<void> checkPalindrome(String text) async {
    String clean = text.replaceAll(RegExp(r'\s+'), '').toLowerCase();
    String reversed = clean.split('').reversed.join('');
    if (clean == reversed) {
      isPalindrome = true;
    } else {
      isPalindrome = false;
    }
    print('ini adalah ${isPalindrome}');
    notifyListeners();
  }
}
