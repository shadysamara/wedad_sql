import 'package:flutter/material.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/ui/news_widget.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<NewsProvider>(builder: (x, provider, y) {
      return ListView.builder(
          itemCount: provider.favouriteNews.length,
          itemBuilder: (context, index) {
            return NewsWidget(provider.favouriteNews[index]);
          });
    });
  }
}
