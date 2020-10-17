import 'package:flutter/material.dart';

class AppNotifierClass with ChangeNotifier {
  bool changed;
  AppNotifierClass(this.changed);

  getChange() {
    if (changed != null)
      return changed;
    else
      return false;
  }

  setChange(bool change) async {
    changed = change;
    //notifyListeners();
  }
}