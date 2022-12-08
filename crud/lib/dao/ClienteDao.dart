import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ClienteDao {
  static Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, "cliente.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
        "CREATE TABLE clientes(id INTEGER PRIMARY KEY AUTOINCREMENT,cliente TEXT, obs TEXT,email TEXT)");
    });
  }
  //Insert client into data base
  Future<int> creatCliente (String? cliente, String? email, String? obs,) async {
    final db = await ClienteDao.init();
    final dataValues = {'cliente': cliente, 'email':email, 'obs':obs};
    final id = await db.insert('clientes', dataValues,conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  //Get all client into data base
   Future<List<Map<String,dynamic>>> getAllItems() async{
    final db = await ClienteDao.init();
    return db.query('clientes', orderBy: "id");
  }

  //get one item
  Future<List<Map<String,dynamic>>> getItem(int id) async{
    final db = await ClienteDao.init();
    return db.query('clientes', where: "id = ?", whereArgs: [id], limit: 1);
  }

  //delete item
  Future<void> deleteItem(int id) async {
    final db = await ClienteDao.init();
    try{
      db.delete('clientes',where: "id = ?",whereArgs: [id]);
    }catch(e){
      debugPrint("error to delete $e");
    }
  }
  //update item
  Future<int> updateItem(int id,String? cliente, String? email, String? obs) async{
    final db = await ClienteDao.init();
    final itemUpdated = {'cliente': cliente, 'email':email, 'obs':obs};
    final resultUpdate = await db.update('clientes', itemUpdated, where: " id = ?", whereArgs: [id]);
    return resultUpdate;
  }



}
