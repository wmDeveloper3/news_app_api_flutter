import 'package:get/state_manager.dart';
import 'package:dio/dio.dart';
import 'package:news_app_api_flutter/core/Strings.dart';
import 'package:news_app_api_flutter/models/newsInfo.dart';

class HomeController extends GetxController{

  Future<NewsModel> response;

  @override
  void onInit() {
    this.response = getHttp();
    super.onInit();
  }


  Future<NewsModel> getHttp() async {
    NewsModel newsModel;
  try {
    var response = await Dio().get(Strings.newsURL);
    if(response.statusCode == 200){
      var jsonString = response.data;
      
      newsModel = NewsModel.fromJson(jsonString);
    }
  } catch (e) {
    print(e);
  }

  return newsModel;
}

}