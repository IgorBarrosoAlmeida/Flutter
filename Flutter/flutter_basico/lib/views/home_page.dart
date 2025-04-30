import 'package:flutter/material.dart';
import 'package:flutter_basico/controller/home_controller.dart';
import 'package:flutter_basico/models/post_model.dart';
import 'package:flutter_basico/repositories/home_repository_dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = HomeController(HomeRepositoryDio());

  @override
  void initState() {
    super.initState();
    _homeController.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Posts",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: ValueListenableBuilder<List<PostModel>>(
          valueListenable: _homeController.posts,
          builder: (_, posts, __) {
            return ListView.separated(
              itemCount: posts.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(posts[index].title),
                  leading: Text(posts[index].id.toString()),
                  trailing: Icon(Icons.arrow_forward),
                );
              },
              separatorBuilder: (_, __) => const Divider(),
            );
          },
        ),
      ),
    );
  }
}
