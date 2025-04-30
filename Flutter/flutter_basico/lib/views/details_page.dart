import 'package:flutter/material.dart';
import 'package:flutter_basico/models/post_model.dart';
import 'package:flutter_basico/widgets/custom_app_bar.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    PostModel post = ModalRoute.of(context)!.settings.arguments as PostModel;

    return Scaffold(
      appBar: CustomAppBar(title: "Notice: ${post.id}"),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              post.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(post.body, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text("Author: ${post.userId}", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
