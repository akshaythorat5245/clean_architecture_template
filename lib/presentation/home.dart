import 'package:clean_architecture_ess/presentation/homestate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Home extends StatefulWidget {
  HomeState homeState;

  Home({Key key, @required this.homeState}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _body() {
    return Observer(
      builder: (_) {
        if (widget.homeState.isLoading)
          return Center(
            child: CircularProgressIndicator(),
          );

        if (widget.homeState.userList == null ||
            widget.homeState.userList.isEmpty) {
          return Center(
            child: Text('No data Available'),
          );
        }

        return ListView.builder(
            itemCount: widget.homeState.userList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Text('Name: ${widget.homeState.userList[index].name}'),
                  Text('Email: ${widget.homeState.userList[index].email}'),
                  Text('Gender: ${widget.homeState.userList[index].gender}'),
                  Text('Status: ${widget.homeState.userList[index].status}'),
                ],
              );
            });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _body()));
  }
}
