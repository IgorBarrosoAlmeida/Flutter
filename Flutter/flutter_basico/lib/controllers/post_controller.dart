import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_basico/models/post_model';

import 'package:http/http.dart' as http;

class PostController {
  ValueNotifier<List<Post>> posts = ValueNotifier<List<Post>>([]);
  ValueNotifier<bool> loading = ValueNotifier<bool>(false);

  callAPI() async {
    var client = http.Client();
    try {
      loading.value = true;
      var response = await client.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      );
      var decodedResponse = jsonDecode(response.body) as List;
      posts.value = decodedResponse.map((e) => Post.fromJson(e)).toList();
    } finally {
      loading.value = false;
      client.close();
    }
  }
}
