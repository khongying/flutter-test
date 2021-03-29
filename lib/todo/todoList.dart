import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as Http;
import '../loading.dart';
import '../todo.type.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  List<TodoType> todoList = [];
  int _selectedIndex = 0;
  bool isLoading = true;

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
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: 750,
          color: Colors.white,
          child: Stack(children: [
            Container(
                padding: EdgeInsets.only(top: 15),
                alignment: Alignment.center,
                width: size.width,
                height: 150,
                color: HexColor('#3A1C71'),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: MaterialButton(
                              onPressed: () {
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (BuildContext context) => Mission()));
                              },
                              child: Icon(
                                Icons.home,
                                color: Colors.white,
                                size: 30.0,
                              ))),
                      Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                              width: 266.0,
                              height: 50.0,
                              child: Text(
                                'TODO LIST',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21),
                              )))
                    ])),
            Positioned(
              top: 110,
              child: Container(
                height: 700,
                width: size.width,
                padding:
                EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [HexColor('#D76D77'), HexColor('#FFAF7B')]),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top:30),
                          child: ListView(children: getData()),
                        )),
                  ],
                ),
              ),
            ),
            isLoading ? LoadingPage() : Stack()
          ]),
        ),
      ),
    );
  }

  List<Widget> getData() {
    List<Widget> data = [];
    todoList.forEach((x) {
      if (x.completed) {
        // true
        data.add(Container(
            child: Column(
              children: <Widget>[
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.check, size: 40, color: Colors.green),
                      title: Text(x.title.toString()),
                    )),
              ],
            )));
      } else {
        // false
        data.add(Container(
            child: Column(
              children: <Widget>[
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.close, size: 40, color: Colors.red),
                      title: Text(x.title.toString()),
                    )),
              ],
            )));
      }
    });
    return data;
  }
}
