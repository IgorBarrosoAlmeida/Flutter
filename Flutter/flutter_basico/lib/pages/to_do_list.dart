import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  TextEditingController _textFieldController = TextEditingController();
  List<String> _taskList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To do list",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(controller: _textFieldController),
            Container(
              height: 400,
              child: ListView.separated(
                separatorBuilder:
                    (context, index) => Divider(color: Colors.grey),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_taskList[index]),
                    onLongPress: () {
                      setState(() {
                        _taskList.removeAt(index);
                      });
                    },
                  );
                },
                itemCount: _taskList.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              if (_textFieldController.text.isNotEmpty) {
                setState(() {
                  _taskList.add(_textFieldController.text);
                });
                _textFieldController.clear();
              }
            },
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _taskList = [];
              });
            },
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(Icons.clear),
          ),
        ],
      ),
    );
  }
}
