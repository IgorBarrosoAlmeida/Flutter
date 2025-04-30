import 'package:flutter_basico/models/post_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getPostList();
}
