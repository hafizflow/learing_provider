import 'package:flutter/cupertino.dart';

class FavoriteProvider extends ChangeNotifier {
  List<int> _myFavorite = [];
  List<int> get myFavorite => _myFavorite;

  setMyFavorite(int item) {
    _myFavorite.add(item);
    notifyListeners();
  }

  removeMyFavorite(int item) {
    _myFavorite.remove(item);
    notifyListeners();
  }

  removeSelected(int val) {
    _myFavorite.removeAt(val);
    notifyListeners();
  }
}
