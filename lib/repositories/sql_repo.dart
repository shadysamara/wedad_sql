import 'dart:developer';
import 'dart:io';

import 'package:news_app/models/nerws_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqlRepo {
  SqlRepo._();
  static SqlRepo sqlRepo = SqlRepo._();
  static const String tableName = 'newsTable';
  static const String newsIdColumnName = 'newsId';
  static const String newsTitleColumnName = 'newsTitle';
  static const String newsDescriptionColumnName = 'newsDesc';
  static const String newsIsFavouriteColumnName = 'isFav';
  Database? database;
  initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbFullPath = directory.path + '/news.db';
    database = await openDatabase(dbFullPath, version: 1, onCreate: (db, v) {
      db.execute(
          'CREATE TABLE $tableName ($newsIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT, $newsTitleColumnName TEXT,  $newsDescriptionColumnName TEXT,$newsIsFavouriteColumnName INTEGER)');
    });
   
  }

  addNew(NewsModel newsModel) async {
    int rowIndex = await database!.insert(tableName, newsModel.toMap());
    log(rowIndex.toString());
  }

  Future<List<NewsModel>> getAllNews() async {
    List<Map<String, dynamic>> rowsMaps = await database!.query(tableName);
    List<NewsModel> results =
        rowsMaps.map((e) => NewsModel.fromMap(e)).toList();
    return results;
  }

  updateModel(NewsModel newsModel) {
    database!.update(tableName, newsModel.toMap(),
        where: '$newsIdColumnName=${newsModel.id}');
  }

  deleteModel(NewsModel newsModel) {
    database!.delete(tableName, where: '$newsIdColumnName=${newsModel.id}');
  }
}
