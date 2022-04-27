import 'package:clean_architecture_ess/presentation/homestate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Home extends StatefulWidget {
  HomeState homeState;

  Home({Key key, @required this.homeState}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

const textStyle=  TextStyle(fontSize: 15, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500, color: Colors.black);
const textStyleWhite=  TextStyle(fontSize: 20,  fontWeight: FontWeight.w700, color: Colors.white);
const textStyleAdd=  TextStyle(fontSize: 15,  fontWeight: FontWeight.w500, color: Colors.black, backgroundColor: Colors.white);

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: Colors.white,
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);
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
                    Expanded(flex:2,child: ElevatedButton(onPressed: (){}, child: Text("Add", style: textStyleAdd,),style: raisedButtonStyle, ))

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
