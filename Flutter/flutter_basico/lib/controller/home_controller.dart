import 'package:flutter/widgets.dart';
import 'package:flutter_basico/models/post_model.dart';
import 'package:flutter_basico/repositories/home_repository.dart';

class HomeController {
  final HomeRepository _homeRepository;
  HomeController(this._homeRepository);

  ValueNotifier<List<PostModel>> posts = ValueNotifier([]);

  fetch() async {
    posts.value = await _homeRepository.getPostList();
  }
}
