import 'package:clean_architecture_ess/presentation/create_user/createuserstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:clean_architecture_ess/presentation/design_consts.dart';

class CreateUser extends StatefulWidget {
  CreateUserState createUserState;

  CreateUser({Key key, @required this.createUserState}) : super(key: key);

  @override
  _CreateUserState createState() => _CreateUserState();
}

String genderdropdownvalue = 'Male';
var genderItems = [
  'Male',
  'Female',
];

String statusdropdownvalue = 'Active';
var statusItems = [
  'Active',
  'Inactive',
];

class _CreateUserState extends State<CreateUser> {
  Widget _body() {
    return Observer(builder: (_) {
      if (widget.createUserState.isLoading)
        return Center(
          child: CircularProgressIndicator(),
        );
      else
        return Container(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(color: Colors.blue),
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 7,
                          child: Text("Create User", style: textStyleWhite)),
                      Expanded(flex: 2, child: Container())
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 9,
                  child: Column(
                    children: [
                      Card(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: 10, left: 20, top: 10, right: 20),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter Name',
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: 10, left: 20, top: 10, right: 20),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter Email',
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: 10, left: 20, top: 10, right: 20),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text("Gender:  ", style: textStyle),
                                  DropdownButton(
                                      elevation: 0,
                                      value: genderdropdownvalue,
                                      items: genderItems.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items, style: textStyle),
                                        );
                                      }).toList(),
                                      onChanged: (String value) {
                                        setState(() {
                                          genderdropdownvalue = value;
                                        });
                                      }),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: 10, left: 20, top: 10, right: 20),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text("Status:  ", style: textStyle),
                                  DropdownButton(
                                      elevation: 0,
                                      value: statusdropdownvalue,
                                      items: statusItems.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items, style: textStyle),
                                        );
                                      }).toList(),
                                      onChanged: (String value) {
                                        setState(() {
                                          statusdropdownvalue = value;
                                        });
                                      }),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Create",
                                style: textStyleCreate,
                              ),
                              style: createButtonStyle,
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _body()));
  }
}
