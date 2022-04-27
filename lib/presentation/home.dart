import 'package:clean_architecture_ess/application/create_user_module.dart';
import 'package:clean_architecture_ess/presentation/create_user/create_user.dart';
import 'package:clean_architecture_ess/presentation/design_consts.dart';
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

        return Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(color: Colors.blue),
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(flex:7,child: Text("UserList", style: textStyleWhite)),
                    Expanded(flex:2,child: ElevatedButton(onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CreateUser(createUserState: CreateUserModule.userState())));
                    }, child: Text("Add", style: textStyleAdd,),style: raisedButtonStyle, )
                    )

                  ],
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: ListView.builder(
                  itemCount: widget.homeState.userList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(margin: EdgeInsets.only(bottom: 10, left: 20, top: 10), alignment: Alignment.centerLeft,child: Text('Name: ${widget.homeState.userList[index].name}',textAlign: TextAlign.start,style:textStyle,)),
                          Container(margin: EdgeInsets.only(bottom: 10, left: 20), alignment: Alignment.centerLeft,child: Text('Email: ${widget.homeState.userList[index].email}',textAlign: TextAlign.start,style:textStyle,)),
                          Container(margin: EdgeInsets.only(bottom: 10, left: 20), alignment: Alignment.centerLeft,child: Text('Gender: ${widget.homeState.userList[index].gender}',textAlign: TextAlign.start,style:textStyle,)),
                          Container(margin: EdgeInsets.only(bottom: 10, left: 20), alignment: Alignment.centerLeft,child: Text('Status: ${widget.homeState.userList[index].status}',textAlign: TextAlign.start,style:textStyle,)),

                        ],
                      ),
                    );
                  }),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _body()));
  }
}
