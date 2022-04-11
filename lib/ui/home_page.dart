import 'package:flutter/material.dart';
import 'package:news_app/ui/add_new_news_page.dart';
import 'package:news_app/ui/all_news_page.dart';
import 'package:news_app/ui/favourite_news_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AddNewsPage();
              }));
            },
          ),
          appBar: AppBar(
            title: Text('News App'),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.list),
                text: 'All News',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favourite News',
              )
            ]),
          ),
          body: TabBarView(children: [AllNewsPage(), FavouritePage()]),
        ));
  }
}
