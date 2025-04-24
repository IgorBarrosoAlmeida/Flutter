import 'package:flutter/material.dart';
import 'package:flutter_basico/controllers/post_controller.dart';
import 'package:flutter_basico/widgets/custom_button_widget.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final PostController _controller = PostController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: Listenable.merge([
                  _controller.posts,
                  _controller.loading,
                ]),
                builder: (context, __) {
                  if (_controller.loading.value) {
                    return CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _controller.posts.value.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_controller.posts.value[index].title),
                        );
                      },
                    );
                  }
                },
              ),
              CustomButtonWidget(
                onPressed: _controller.callAPI,
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
