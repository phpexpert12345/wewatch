import 'package:flutter/material.dart';

class AppNotifierClass with ChangeNotifier {
  bool changed,locationChange,changeComment;
  AppNotifierClass(this.changed,this.locationChange,this.changeComment);


  getChange() {
    if (changed != null)
      return changed;
    else
      return false;
  }
  getComment() {
    if (changeComment != null)
      return changeComment;
    else
      return false;
  }
  getLocationChange() {
    if (locationChange != null)
      return locationChange;
    else
      return false;
  }

  setChange(bool change) async {
    changed = change;
    //notifyListeners();
  }
  setComment(bool change) async {
    changeComment = change;
    //notifyListeners();
  }
  setLocationChange(bool change) async {
    locationChange = change;
    //notifyListeners();
  }
}