import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:mc_crud_test/core/models/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseApp {
  static final DataBaseApp instance = DataBaseApp._init();
  static Database? _database;

  DataBaseApp._init();

  Future<Database> get database async {
    if (_database != null)
      return _database!;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    const idType='INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType='TEXT';
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "AppDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE  $tableUser ("
          "${UserFields.id} $idType,"
          " ${UserFields.firstname} TEXT,"
          "  ${UserFields.lastname} TEXT,"
          " ${UserFields.phoneNumber} TEXT,"
          " ${UserFields.dateOfBirth} TEXT,"
          " ${UserFields.email} TEXT,"
          " ${UserFields.bankAccountNumber} TEXT"
          ")");
    });
  }

  newUser(UserModel userModel) async {
    final db = await database;
    var res = await db.insert(tableUser, userModel.toJson());
    print(res);
    return res;
  }


  getUser(String email) async {
    final db = await database;
    var res =await  db.query( tableUser, columns: UserFields.value, where: "${UserFields.email}= ?", whereArgs: [email]);
    return res.isNotEmpty ? UserModel.fromJson(res.first) : Null ;
  }

  getAllUser() async {
    final db = await database;
    final orderBy='${UserFields.id} ASC';
    var res = await db.query(tableUser);
    List<UserModel> list =
    res.isNotEmpty ? res.map((c) => UserModel.fromJson(c)).toList() : [];
    return list;
  }

   Future close() async{
    final db =await instance.database;
    db.close();
   }
}

