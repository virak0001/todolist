
import 'package:flutter/material.dart';
import 'todo.dart';
class DiesplayList extends StatefulWidget {
  @override
  _DiesplayListState createState() => _DiesplayListState();
}
class _DiesplayListState extends State<DiesplayList> {
  //create array list for store user input
  List<Todo> todos = [];
  //create value controller to get value from user input
  TextEditingController controller = TextEditingController();
  //create function for modal Dialog
  void createDialogModal(BuildContext context) async {
    final getList = await showDialog<Todo>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("New Todo"),
            content: TextField(
              autofocus: true,
              controller: controller,
            ),
            actions: <Widget>[
              // material button (add) in modal dialog
              MaterialButton(
                child: Text("Cancel", style: TextStyle(color: Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              // material button (cancel) in modal dialog
              MaterialButton(
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  final todo = new Todo(title: controller.value.text);
                  if (todo.title != "") {
                    Navigator.of(context).pop(todo);
                  }
                  controller.clear();
                },
              ),
            ],
          );
        });
        if (getList != null) {
        setState(() {
          todos.add(getList);
        });
    }
  }

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];
    return CheckboxListTile(
      value: todo.isDone,
      title: Text(todo.title),
       onChanged: (bool value){
          setState(() {
          todo.isDone = value;
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Todo List')
      ),
      body: ListView.builder(
          itemBuilder: _buildItem,
          itemCount: todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:(){createDialogModal(context);}
      ),
    );
  }
}