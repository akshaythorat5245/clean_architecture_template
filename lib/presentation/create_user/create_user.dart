import 'package:clean_architecture_ess/presentation/create_user/createuserstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:clean_architecture_ess/presentation/design_consts.dart';

class CreateUser extends StatefulWidget {
  CreateUserState createUserState;

  CreateUser({Key key, @required this.createUserState}) : super(key: key);

  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  Widget _body() {
    return Observer(builder: (_) {
      if (widget.createUserState.isLoading)
        return Center(
          child: CircularProgressIndicator(),
        );
      else if (widget.createUserState.isSucess) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          // set up the button
          Widget okButton = TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          );

          // set up the AlertDialog
          AlertDialog alert = AlertDialog(
            title: Text("Sucess"),
            content: Text("User Created Sucessfully."),
            actions: [
              okButton,
            ],
          );

          // show the dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        });
        return Container();
      } else
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
                                onChanged: (value) => {
                                  setState(() {
                                    widget.createUserState.name = value;
                                  })
                                },
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
                                onChanged: (value) => {
                                  setState(() {
                                    widget.createUserState.email = value;
                                  })
                                },
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
                                      value: widget
                                          .createUserState.genderdropdownvalue,
                                      items: widget.createUserState.genderItems
                                          .map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items, style: textStyle),
                                        );
                                      }).toList(),
                                      onChanged: (String value) {
                                        setState(() {
                                          widget.createUserState
                                              .genderdropdownvalue = value;
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
                                      value: widget
                                          .createUserState.statusdropdownvalue,
                                      items: widget.createUserState.statusItems
                                          .map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items, style: textStyle),
                                        );
                                      }).toList(),
                                      onChanged: (String value) {
                                        setState(() {
                                          widget.createUserState
                                              .statusdropdownvalue = value;
                                        });
                                      }),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                widget.createUserState.createUser();
                              },
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
