import 'package:flutter/material.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:provider/provider.dart';

class AddNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('New News'),
      ),
      body: Consumer<NewsProvider>(builder: (context, provider, x) {
        return Column(
          children: [
            TextField(
              controller: provider.titleController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'News Title'),
            ),
            TextField(
              controller: provider.descriptionController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'News Description'),
            ),
            CheckboxListTile(
                value: provider.isFavourite,
                onChanged: (v) {
                  provider.isFavourite = v!;
                  provider.notifyListeners();
                }),
            ElevatedButton(
                onPressed: () {
                  provider.addNewToDatabase();
                },
                child: const Text('Add New News'))
          ],
        );
      }),
    );
  }
}
