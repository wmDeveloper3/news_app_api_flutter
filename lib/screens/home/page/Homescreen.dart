import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_api_flutter/core/colorPalette.dart';
import 'package:news_app_api_flutter/getx/HomeController.dart';
import 'package:news_app_api_flutter/models/newsInfo.dart';

class HomeScreen extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.PRIMARY_COLOR,
        title: Text("NEWS APP"),
      ),
      body: Container(
        child: FutureBuilder<NewsModel>(
          future: _controller.response,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.articles.length,
                itemBuilder: (context, index) {
                  var articles = snapshot.data.articles[index];
                  return Container(
                    height: 100.0,
                    margin: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.network(
                              articles.urlToImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                articles.title,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                articles.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
