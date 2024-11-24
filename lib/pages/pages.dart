import 'package:flutter/material.dart';
import 'package:todolist1/data/database.dart';
import 'package:todolist1/utilities/dialog_box.dart';
import 'package:todolist1/utilities/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _HomePageState();
}

class _HomePageState extends State<homePage> {
  // reference the hive box
  final _myBox = Hive.box('MyBox');

  // text controller
  final _controller = TextEditingController();

  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      // if this is first time open this app , load the defalut data
      db.createInitialData();
    } else {
      //  if not , load the data
      db.loadData();
    }
    super.initState();
  }

  // save a new task
  void _onSave() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
    db.updateData();
  }

  // checkBoxChanged
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  // create a new task method
  void CreatNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: _onSave,
        );
      },
    );
  }

  // delete task
  void _taskDelete(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TO DO LIST"),
      ),
      backgroundColor: Colors.yellow[200],
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => _taskDelete(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            return CreatNewTask();
          },
          child: Icon(Icons.add),
          tooltip: 'Add a new task',
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black),
    );
  }
}
