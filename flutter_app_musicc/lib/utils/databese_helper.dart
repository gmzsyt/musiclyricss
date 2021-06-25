import 'dart:io';

import 'package:flutter_app_musicc/model/favmodel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  String _lyricsTable = "lyricstable";
  String _id = "id";
  String _fav = "favsong";
  String _type = "type";

  factory DatabaseHelper(){
    if(_databaseHelper == null){
      _databaseHelper = DatabaseHelper._internal();
      return  _databaseHelper!;
    }else{
      return _databaseHelper!;
    }
  }

  DatabaseHelper._internal();

  Future <Database?> _getDatabase() async{
    if(_database == null){
      _database = await _initializeDatabase();
      return _database;
    }else{
      return _database;
    }
  }

  _initializeDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String dbpath = join(folder.path, "lyricsDB");
    var lyricsDB = openDatabase(dbpath,version: 1,onCreate: _createDB);
    return lyricsDB;
  }

  Future<void> _createDB(Database db, int version) async{
    await db.execute("CREATE TABLE $_lyricsTable ($_id INTEGER PRIMARY KEY AUTOINCREMENT,$_fav TEXT, $_type TEXT)");
  }

  Future<List<Map<String,dynamic>>?> getFav() async {
    var db = await _getDatabase();
    var sonuc = await db?.query(_lyricsTable);
    return sonuc;
  }

  Future<int?> addFav(FavModel favModel) async{
    var db = await _getDatabase();
    var sonuc = await db?.insert(_lyricsTable, favModel.toMap());
    return sonuc;
  }

  Future<int?> deleteFav(String favsong) async{
    var db = await _getDatabase();
    var sonuc = await db?.delete(_lyricsTable,where: '$_fav = ? ',whereArgs: [favsong]);
    print("Favori silindi");
    return sonuc;
  }
}