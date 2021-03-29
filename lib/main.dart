import 'package:flutter/material.dart';
import 'package:flutter_app/todo/todoList.dart';
import 'member.dart';


void main() {
  runApp(MyApp());
}

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({this.userId, this.id, this.title, this.completed});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestApp(),
    );
  }
}

class TestApp extends StatefulWidget {
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  int _selectedIndex = 0;
  final List<Widget> _children = [
    TodoList(),
    Member()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        // resizeToAvoidBottomPadding: true,
        body: _children[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.supervisor_account),
                label: 'Member',
                backgroundColor: Colors.green,
              )
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped));
  }

  void _onItemTapped(int index) {
    try{
      setState(() {
        print(index);
        _selectedIndex = index;
      });
    }catch(e) {
      print(e.toString());
    }
  }

  submit() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Member()));
  }
}
