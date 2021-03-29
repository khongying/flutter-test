import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'loading.dart';
import 'member.type.dart';
import 'memberDetail/memberDetail.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Member extends StatefulWidget {
  @override
  _MemberState createState() => _MemberState();
}

class _MemberState extends State<Member> {
  List<MemberType> memberList = [];
  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    fatchMember();
  }

  Future<void> fatchMember() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await Http.get(url);
    setState(() {
      memberList = memberTypeFromJson(response.body);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.red[300],
        title: Text("Member list"),
    ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: getMember(),
          ),
          isLoading ? LoadingPage() : Stack()
        ],
      ),);
  }

  List<Widget> getMember() {
    List<Widget> data = [];
    memberList.forEach((x) {
      data.add(
        Container(
            child: Column(
              children: <Widget>[
                Card(
                    child: ListTile(
                      leading: Icon(Icons.account_circle, size: 50),
                      title: Text(x.name.toString()),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MemberDetail(
                                  member: x,
                                ),
                          ),
                        );
                      },
                    )),
              ],
            )),
      );
    });
    return data;
  }
}
