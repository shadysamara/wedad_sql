import 'package:flutter/material.dart';
import 'package:news_app/models/nerws_model.dart';
import 'package:news_app/repositories/sql_repo.dart';
// good question from khaled
class NewsProvider extends ChangeNotifier {
  NewsProvider() {
    SqlRepo.sqlRepo.initDatabase();
  }
  List<NewsModel> allNews = [];
  List<NewsModel> favouriteNews = [];
  bool isFavourite=false;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  getAllNews() {
  }
  addNewToDatabase() {}
  addNewToFavourite() {}
  deleteNewsFromDatabase() {}
}
