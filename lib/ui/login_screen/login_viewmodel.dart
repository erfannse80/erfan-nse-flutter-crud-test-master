import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mc_crud_test/core/db/database_app.dart';
import 'package:mc_crud_test/core/models/user_model.dart';

class LoginViewModel extends ChangeNotifier {
  late bool isLogin ;
  final emailController=TextEditingController();
   late UserModel userModel;




  void increment() {
    notifyListeners();
  }


  void setLogin(bool login) {
    isLogin=login;
    notifyListeners();
  }

   getLogin() async {
    userModel=await DataBaseApp.instance.getUser(emailController.text.toString());
    if(userModel.email!.isNotEmpty){
      print("ok");
      setLogin(true);
    }

      notifyListeners();



  }
}