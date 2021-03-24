import 'package:flutter/material.dart';
import 'package:flutter_app/member.type.dart';
import 'package:flutter_app/memberDetail/memberDetail.type.dart';

class MemberDetail extends StatefulWidget {
  MemberType member;

  MemberDetail({this.member});

  @override
  _MemberDetailState createState() => _MemberDetailState(member);
}

class _MemberDetailState extends State<MemberDetail> {
  MemberType member;

  _MemberDetailState(this.member);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    if (member != null) {
      return Scaffold(
          appBar: AppBar(
            title: Text(member.name),
          ),
          body: Container(
            child: Card(
              child: Column(children: <Widget>[
                 ListTile(
                  title: Text('Company'),
                  subtitle: Text(member.company.name.toString()),
                ),
                ListTile(
                  title: Text('Phone'),
                  subtitle: Text(member.phone.toString()),
                ),
                ListTile(
                  title: Text('Email'),
                  subtitle: Text(member.email.toString()),
                ),
                ListTile(
                  title: Text('Address'),
                  subtitle: Text('${member.address.suite.toString()} ${member.address.street.toString()} ${member.address.city.toString()} ${member.address.zipcode.toString()}'),
                ),
              ]),
            ),
          ));
    }
  }
}
