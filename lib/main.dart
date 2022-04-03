import 'package:flutter/material.dart';
import 'package:mc_crud_test/ui/home_screen/home_screen.dart';
import 'package:mc_crud_test/ui/home_screen/home_viewmodel.dart';
import 'package:mc_crud_test/ui/login_screen/login_screen.dart';
import 'package:mc_crud_test/ui/login_screen/login_viewmodel.dart';
import 'package:mc_crud_test/ui/singup_screen/singup_screen.dart';
import 'package:mc_crud_test/ui/singup_screen/singup_viewmodel.dart';
import 'package:mc_crud_test/ui/users_screen/user_screen.dart';
import 'package:mc_crud_test/ui/users_screen/user_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>LoginViewModel(),),
        ChangeNotifierProvider(create: (_)=>HomeViewModel(),),
        ChangeNotifierProvider(create: (_)=>SingUpViewModel(),),
        ChangeNotifierProvider(create: (_)=>UsersViewModel(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.grey,
                primaryTextTheme: TextTheme(
                    headline6: TextStyle(
                        color: Colors.white
                    )
                )
        ),
        home:  HomeScreen(),
        onGenerateRoute: (setting){
          // Handle '/'
          if (setting.name == '/') {
            return MaterialPageRoute(builder: (context) => HomeScreen());
          }
          if (setting.name == '/login') {
            return MaterialPageRoute(builder: (context) => LoginScreen());
          }
          if (setting.name == '/singUp') {
            return MaterialPageRoute(builder: (context) => SingUpScreen());
          }
          if (setting.name == '/users') {
            return MaterialPageRoute(builder: (context) => UsersScreen());
          }

          // Handle '/details/:id'
         /* var uri = Uri.parse(setting.name);
          if (uri.pathSegments.length == 2 &&
              uri.pathSegments.first == 'details') {
            var id = uri.pathSegments[1];
            return MaterialPageRoute(builder: (context) => DetailScreen(id: id));
          }*/

         /* return MaterialPageRoute(builder: (context) => UnknownScreen());*/
        },
      ),
    );
  }
}
