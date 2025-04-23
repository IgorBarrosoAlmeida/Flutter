import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_basico/widgets/custom_button_widget.dart';
import 'package:http/http.dart' as http;

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: Listenable.merge([posts, loading]),
                builder: (context, __) {
                  if (loading.value) {
                    return CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: posts.value.length,
                      itemBuilder: (context, index) {
                        return ListTile(title: Text(posts.value[index].title));
                      },
                    );
                  }
                },
              ),
              CustomButtonWidget(
                onPressed: callAPI,
                title: "Button",
                isDisable: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);

  factory Post.fromJson(Map json) {
    return Post(json['userId'], json['id'], json['title'], json['body']);
  }
}
