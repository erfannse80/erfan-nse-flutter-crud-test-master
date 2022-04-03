import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  bool isLogin =false;


  void setLogin(bool login) {
    isLogin=login;
    notifyListeners();
  }

  void getLogin() {
    notifyListeners();
  }
}