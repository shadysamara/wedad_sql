import 'package:flutter/material.dart';
import 'package:news_app/models/nerws_model.dart';
import 'package:news_app/repositories/sql_repo.dart';

// good question from khaled
class NewsProvider extends ChangeNotifier {
  NewsProvider() {
    SqlRepo.sqlRepo.initDatabase();
     getAllNews();
  }
  List<NewsModel> allNews = [];
  List<NewsModel> favouriteNews = [];
  bool isFavourite = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  getAllNews() async {
    allNews = await SqlRepo.sqlRepo.getAllNews();
    getFavouriteNews();
  }

  getFavouriteNews() {
    favouriteNews = allNews.where((element) => element.isFavourite).toList();
    notifyListeners();
  }

  addNewToDatabase() async{
    NewsModel newsModel = NewsModel(
        title: titleController.text,
        description: descriptionController.text,
        isFavourite: isFavourite);
   await SqlRepo.sqlRepo.addNew(newsModel);
    getAllNews();
  }

  addNewToFavourite(NewsModel newsModel) async {
    newsModel.isFavourite = !newsModel.isFavourite;
    await SqlRepo.sqlRepo.updateModel(newsModel);
    getAllNews();
  }

  deleteNewsFromDatabase(NewsModel newsModel) async {
    await SqlRepo.sqlRepo.deleteModel(newsModel);
    getAllNews();
  }
}
