import 'package:news_app/repositories/sql_repo.dart';

class NewsModel{
  late int id;
  late String title;
  late String description;
  late bool isFavourite;
  NewsModel({required this.id,required this.title,required this.description,required this.isFavourite});
  NewsModel.fromMap(Map<String,dynamic> map){
  id = map[SqlRepo.newsIdColumnName];
  title = map[SqlRepo.newsTitleColumnName];
  description = map[SqlRepo.newsDescriptionColumnName];
  isFavourite = map[SqlRepo.newsIsFavouriteColumnName]==1?true:false;
}
toMap(){
  return {
    SqlRepo.newsTitleColumnName:title,
    SqlRepo.newsDescriptionColumnName:description,
    SqlRepo.newsIsFavouriteColumnName:isFavourite?1:0
  };
}

}