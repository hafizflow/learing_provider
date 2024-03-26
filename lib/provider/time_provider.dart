import 'package:flutter/cupertino.dart';

class TimeProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  setCount() {
    _count++;
    notifyListeners();
  }
}
