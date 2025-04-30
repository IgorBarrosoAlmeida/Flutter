import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_basico/models/post_model.dart';

import 'home_repository.dart';

class HomeRepositoryMock implements HomeRepository {
  @override
  Future<List<PostModel>> getPostList() async {
    String jsonStr = await rootBundle.loadString('assets/data.json');
    List postJson = jsonDecode(jsonStr);
    return postJson.map((e) => PostModel.fromJson(e)).toList();
  }
}
