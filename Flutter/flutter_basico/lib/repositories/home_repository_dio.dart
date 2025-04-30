import 'package:dio/dio.dart';
import 'package:flutter_basico/models/post_model.dart';
import 'package:flutter_basico/repositories/home_repository.dart';

class HomeRepositoryDio implements HomeRepository {
  @override
  Future<List<PostModel>> getPostList() async {
    try {
      var response = await Dio().get(
        'https://jsonplaceholder.typicode.com/posts',
      );
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } catch (e) {
      print(e);
    }
    return [];
  }
}
