import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mc_crud_test/core/db/database_app.dart';
import 'package:mc_crud_test/core/models/user_model.dart';

class UsersViewModel extends ChangeNotifier {
  late List<UserModel> list_usersModel;

  Future<List<UserModel>> getUsers() async {
    print("get user -------");
    list_usersModel =await DataBaseApp.instance.getAllUser() ;
    print(list_usersModel.length);
    return list_usersModel;

  }

  void increment() {
    getUsers();
    notifyListeners();
  }


}