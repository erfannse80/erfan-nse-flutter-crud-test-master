import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:mc_crud_test/Globals/CustomColors.dart';
import 'package:mc_crud_test/core/models/user_model.dart';
import 'package:mc_crud_test/ui/users_screen/user_viewmodel.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late List<UserModel> list_usersModel;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel=context.watch<UsersViewModel>();
    usersViewModel.getUsers();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        title: const Text('Users'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'refersh',
            onPressed: () {
              usersViewModel.getUsers();
            },
          ),
        ],
      ),
      body: Container(
        child:
        !usersViewModel.list_usersModel.isEmpty ?
        ListView.builder(
          itemCount: usersViewModel.list_usersModel.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {

              },
              child: Card(
                child: Container(
                  height: 80,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.account_circle,
                          color: Colors.blue,
                          size: 60.0,
                        ),),
                      Expanded(
                        flex: 5,
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0,top: 10),
                                child:Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    usersViewModel.list_usersModel[index].firstname.toString()+" "+ usersViewModel.list_usersModel[index].lastname.toString(),
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0,top: 4),
                                child:Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "DateOfBirth: "+usersViewModel.list_usersModel[index].dateOfBirth.toString(),
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0,top: 4),
                                child:Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    usersViewModel.list_usersModel[index].email.toString(),
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14),
                                  ),
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );
          },
        )
            :
            Center(child: Text("user Not Found"),)
     ),
    );
  }
}
