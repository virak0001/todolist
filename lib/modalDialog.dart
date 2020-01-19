import 'package:flutter/material.dart';
// import 'listTodo.dart';
class ModalDialog extends StatefulWidget {
  @override
  _ModalDialogState createState() => _ModalDialogState();
}

class _ModalDialogState extends State<ModalDialog> {
  TextEditingController _toDoController = TextEditingController();
   Map <String,bool> todos = Map<String, bool>();

  String _showText = "";
  void getListTodo() {
    setState(() {
      _showText = _toDoController.text;
      todos[_showText] = false;
    });
  }
  //function for create modal dialog
  createDialogModal(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("New Todo"),
            content: TextField(
              autofocus: true,
              controller: _toDoController,
              
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
                  getListTodo();
                  Navigator.of(context).pop();
                  _toDoController.clear();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: ListView(
          children: todos.keys.map((String key){
            return CheckboxListTile(
              title: Text(key),
              value: todos[key],
              onChanged: (bool value){
                setState(() {
                  todos[key] = value;
                });
              },
            );
          }).toList(),
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          createDialogModal(context);
        },
      ),
    );
  }
}
