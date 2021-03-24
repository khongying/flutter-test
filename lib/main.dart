import 'package:flutter/material.dart';
import 'package:flutter_app/todo.type.dart';
import 'package:http/http.dart' as Http;

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
  List<TodoType> todoList = [];

  @override
  void initState() {
    super.initState();
    toDoList();
  }

  Future<void> toDoList() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    var response = await Http.get(url);
    setState(() {
      todoList = todoTypeFromJson(response.body);
    });
    print(todoList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('TODO LIST')),
        body: Container(
            child: Column(children: [
          RaisedButton(
            onPressed: () {
              submit();
            },
            child: Text('Member lists'),
            textColor: Colors.white,
            color: Colors.blue,
          ),
          Expanded(
              child: ListView(
            children: getData(),
          )),
        ])));
  }

  List<Widget> getData() {
    List<Widget> data = [];
    todoList.forEach((x) {
      if (x.completed) {
        // true
        data.add(
            Container(
                child: Column(
                  children: <Widget>[
                    Card(
                        child: ListTile(
                          leading: Icon(Icons.check, size: 40, color: Colors.green),
                          title: Text(x.title.toString()),
                        )),
                  ],
                ))
        );
      } else {
        // false
        data.add(
          Container(
              child: Column(
                children: <Widget>[
                  Card(
                      child: ListTile(
                        leading: Icon(Icons.close, size: 40,color: Colors.red),
                        title: Text(x.title.toString()),
                      )),
                ],
              ))
        );
      }
    });
    return data;
  }

  submit() {
    navigateToSecondPage(context);
    // return showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         content: Text('${email.text} - ${password.text}'),
    //       );
    //     });
  }

  navigateToSecondPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) {
      return MySecondPage();
    }));
  }
}
