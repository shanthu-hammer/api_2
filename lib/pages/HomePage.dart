import 'package:api_2/models/newsInfo.dart';
import 'package:api_2/services/api_manager.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Newsmodel> _newsModel;
  @override
  void initState() {
    _newsModel = API_Manager().getNews();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Daily News',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
          child: FutureBuilder<Newsmodel>(
        future: _newsModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.articles.length,
              itemBuilder: (context, index) {
                var article = snapshot.data.articles[index];
                return Container(
                  height: 100,
                  child: Row(
                    children: <Widget>[
                      Image.network(article.urlToImage),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
          return Container(
            height: 100,
            child: Row(
              children: <Widget>[],
            ),
          );
        },
      )),
    );
  }
}
