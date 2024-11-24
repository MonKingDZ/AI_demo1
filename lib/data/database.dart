import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  // To Do List
  //  list of todo tasks
  List toDoList = [];

  // reference the box
  final _myBox = Hive.box('MyBox');

  // defalut data 2
  void createInitialData() {
    toDoList = [
      ['Do Exercise', false],
      ['Make Tutorrial', false],
    ];
  }

  // load data
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update data
  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}
