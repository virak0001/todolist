import 'package:flutter/material.dart';
import 'listTodo.dart';
class ModalDialog extends StatefulWidget {
  @override
  _ModalDialogState createState() => _ModalDialogState();
}

class _ModalDialogState extends State<ModalDialog> {
  TextEditingController _toDoController = TextEditingController();
  String _showText = "";
  void _getListTodo() {
    setState(() {
      _showText = _toDoController.text;
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
                  _getListTodo();
                  Navigator.of(context).pop();
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
      body: Center(
        child: Text(_showText),
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
