import 'package:flutter/material.dart';
import 'package:news_app/models/nerws_model.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:provider/provider.dart';

class NewsWidget extends StatelessWidget {
  NewsModel newsModel;
  NewsWidget(this.newsModel);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.greenAccent, borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          trailing: InkWell(
              onTap: () {
                Provider.of<NewsProvider>(context, listen: false)
                    .deleteNewsFromDatabase(newsModel);
              },
              child: Icon(Icons.delete,
                  )),
          leading: InkWell(
              onTap: () {
                Provider.of<NewsProvider>(context, listen: false)
                    .addNewToFavourite(newsModel);
              },
              child: Icon(Icons.favorite,
                  color: newsModel.isFavourite ? Colors.red : Colors.grey)),
          title: Text(newsModel.title),
          subtitle: Text(newsModel.description),
        ));
  }
}
