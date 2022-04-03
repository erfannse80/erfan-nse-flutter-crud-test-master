import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_crud_test/ui/home_screen/home_viewmodel.dart';
import 'package:mc_crud_test/ui/login_screen/login_screen.dart';
import 'package:mc_crud_test/ui/users_screen/user_screen.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeViewModel loginViewModel=context.watch<HomeViewModel>();
    return  Scaffold(
        body: SafeArea(
          child:Container(
            child: viewScreen(loginViewModel),
          )
        )
    );
  }

  viewScreen(HomeViewModel loginViewModel){
    if(loginViewModel.isLogin){
      return UsersScreen();
    }else{
      return LoginScreen();
    }
  }
}



