import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mc_crud_test/core/db/database_app.dart';
import 'package:mc_crud_test/core/models/user_model.dart';

class SingUpViewModel extends ChangeNotifier {
  bool isLogin = false;
  late UserModel userModel;
  final firstname_controller = TextEditingController();
  final lastname_controller = TextEditingController();
  final phoneNumber_controller = TextEditingController();
  final dateOfBirth_controller = TextEditingController();
  final email_controller = TextEditingController();
  final bankAccountNumber_controller = TextEditingController();

  Future addUser() async {
    print("add user -------");
    print(firstname_controller.text);
    print(lastname_controller.text);
    print(bankAccountNumber_controller.text);
    final userModel = UserModel(
        firstname: firstname_controller.text,
        lastname: lastname_controller.text,
        phoneNumber: phoneNumber_controller.text,
        dateOfBirth: dateOfBirth_controller.text,
        email: email_controller.text,
        bankAccountNumber: bankAccountNumber_controller.text);
        await DataBaseApp.instance.newUser(userModel);
      notifyListeners();



  }

  void increment() {
    notifyListeners();
  }

  void setLogin(bool login) {
    notifyListeners();
  }

  void getLogin() {
    notifyListeners();
  }
}
