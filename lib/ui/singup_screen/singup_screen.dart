import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:mc_crud_test/Globals/CustomColors.dart';
import 'package:mc_crud_test/ui/login_screen/login_viewmodel.dart';
import 'package:mc_crud_test/ui/singup_screen/singup_viewmodel.dart';
import 'package:provider/provider.dart';


class SingUpScreen extends StatelessWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SingUpViewModel singUpViewModel=context.watch<SingUpViewModel>();
    return  Scaffold(
        resizeToAvoidBottomInset :false,
        backgroundColor: CustomColors.background,
        body: SingleChildScrollView(

          child: Column(
            children:  [
              const SizedBox(height: 40,),
              const Center(child: Text("hello Again",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: CustomColors.txt_color_title_login),),),
              const Center(child: Text("welcome get start",style: TextStyle(fontSize: 20,color: CustomColors.txt_color_title_login)),),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(top: 15,left: 20,right: 20),
                child: Center(
                  child: GestureDetector(
                    onTap: (){},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 30,sigmaY: 30),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.6),
                              border: Border.all(
                                  width: 2,
                                  color: Colors.white.withOpacity(0.9)
                              )
                          ),
                          child:  Container(
                            width: double.infinity,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20,right: 10,left: 10),
                                  child: Material(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    elevation: 8.0,
                                    shadowColor: Colors.blue,
                                    color: Colors.white,
                                    child: TextFormField(
                                      controller: singUpViewModel.firstname_controller,
                                      autofocus: false,
                                      decoration: const InputDecoration(
                                        icon: Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Icon(Icons.account_box_rounded , color: CustomColors.primeryColor),
                                        ),
                                        hintText: 'Firstname',
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
                                  child: Material(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    elevation: 8.0,
                                    shadowColor: Colors.blue,
                                    color: Colors.white,
                                    child: TextFormField(
                                      controller: singUpViewModel.lastname_controller,
                                      autofocus: false,
                                      decoration: const InputDecoration(
                                        icon: Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Icon(Icons.account_box_rounded, color: CustomColors.primeryColor),
                                        ),
                                        hintText: 'Lastname',
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20,right: 10,left: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          minTime: DateTime(1980, 1, 1),
                                          maxTime: DateTime(2022, 6, 7), onChanged: (date) {
                                            singUpViewModel.dateOfBirth_controller.text = date.toString();

                                            print('change $date');
                                          }, onConfirm: (date) {
                                            singUpViewModel.dateOfBirth_controller.text = date.toString();
                                            print('confirm $date');
                                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                                    },
                                    child: Material(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      elevation: 8.0,
                                      shadowColor: Colors.blue,
                                      color: Colors.white,
                                      child: GestureDetector(
                                        onTap: () {
                                          DatePicker.showDatePicker(context,
                                              showTitleActions: true,
                                              minTime: DateTime(1980, 1, 1),
                                              maxTime: DateTime(2022, 6, 7), onChanged: (date) {
                                                singUpViewModel.dateOfBirth_controller.text =date.year.toString()+" - "+date.month.toString()+" - "+date.day.toString();
                                              }, onConfirm: (date) {
                                                singUpViewModel.dateOfBirth_controller.text =date.year.toString()+" - "+date.month.toString()+" - "+date.day.toString();
                                              }, currentTime: DateTime.now(), locale: LocaleType.en);
                                        },
                                        child: TextFormField(
                                          controller: singUpViewModel.dateOfBirth_controller,
                                          enableInteractiveSelection: false,
                                          focusNode: FocusNode(),
                                          enabled: false,

                                          decoration: const InputDecoration(
                                            icon: Padding(
                                              padding: EdgeInsets.only(left: 8.0),
                                              child: Icon(Icons.cake_rounded , color: CustomColors.primeryColor),
                                            ),
                                            hintText: 'DateOfBirth',
                                            fillColor: Colors.white,
                                            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
                                  child: Material(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    elevation: 8.0,
                                    shadowColor: Colors.blue,
                                    color: Colors.white,
                                    child: TextFormField(
                                      controller: singUpViewModel.phoneNumber_controller,
                                      autofocus: false,
                                      decoration: const InputDecoration(
                                        icon: Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Icon(Icons.local_phone_rounded, color: CustomColors.primeryColor),
                                        ),
                                        hintText: 'PhoneNumber',
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
                                  child: Material(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    elevation: 8.0,
                                    shadowColor: Colors.blue,
                                    color: Colors.white,
                                    child: TextFormField(
                                      controller: singUpViewModel.email_controller,
                                      autofocus: false,
                                      decoration: const InputDecoration(
                                        icon: Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Icon(Icons.email_rounded, color: CustomColors.primeryColor),
                                        ),
                                        hintText: 'email@gmail.com',
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
                                  child: Material(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    elevation: 8.0,
                                    shadowColor: Colors.blue,
                                    color: Colors.white,
                                    child: TextFormField(
                                      controller: singUpViewModel.bankAccountNumber_controller,
                                      autofocus: false,
                                      decoration: const InputDecoration(
                                        icon: Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Icon(Icons.credit_score_rounded, color: CustomColors.primeryColor),
                                        ),
                                        hintText: 'BankAccountNumber',
                                        fillColor: Colors.white,
                                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 35,left: 10,right: 10,bottom: 20),
                                  child:  ConstrainedBox(
                                    constraints: const BoxConstraints(
                                        minWidth: double.infinity,
                                        minHeight: 45
                                    ),
                                    child: ElevatedButton(
                                        child: Text(
                                            "Sing Up".toUpperCase(),
                                            style: TextStyle(fontSize: 14)
                                        ),
                                        style: ButtonStyle(
                                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                            backgroundColor: MaterialStateProperty.all<Color>(CustomColors.primeryColor),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                    side: BorderSide(color: CustomColors.primeryColor)
                                                )
                                            )
                                        ),
                                        onPressed: () =>{
                                            Navigator.pushNamed(context, "/users")
                                        }
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ),
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25,left: 30,right: 30),
                child: Row(
                    children: const <Widget>[
                      Expanded(
                          child: Divider()
                      ),

                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("or continue with"),
                      ),

                      Expanded(
                          child: Divider()
                      ),
                    ]
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 30,sigmaY: 30),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                border: Border.all(
                                    width: 2,
                                    color: Colors.white.withOpacity(0.9)
                                )
                            ),
                            child:Container(
                              width: 50,
                              height: 50,
                              child: Center(
                                child: Image.asset('assets/images/google.png',width: 35, height: 35,),
                              ),
                            )
                        ),
                      ),

                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 30,sigmaY: 30),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                border: Border.all(
                                    width: 2,
                                    color: Colors.white.withOpacity(0.9)
                                )
                            ),
                            child:Container(
                              width: 50,
                              height: 50,
                              child: Center(
                                child: Image.asset('assets/images/facebook.png',width: 35, height: 35,),
                              ),
                            )
                        ),
                      ),

                    ),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 30,sigmaY: 30),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                border: Border.all(
                                    width: 2,
                                    color: Colors.white.withOpacity(0.9)
                                )
                            ),
                            child:Container(
                              width: 50,
                              height: 50,
                              child: Center(
                                child: Image.asset('assets/images/apple.png',width: 35, height: 35,),
                              ),
                            )
                        ),
                      ),

                    ),
                  ),
                ],),
              Padding(
                padding: EdgeInsets.only(top:48.0),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    child: const Text( ' Login now...', style: TextStyle(fontWeight: FontWeight.bold,color: CustomColors.primeryColor)),

                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        )
    );
  }
}



