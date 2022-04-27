import 'package:clean_architecture_ess/presentation/create_user/createuserstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class CreateUser extends StatefulWidget {
  CreateUserState createUserState;

  CreateUser({Key key, @required this.createUserState}) : super(key: key);

  @override
  _CreateUserState createState() => _CreateUserState();

}

class _CreateUserState extends State<CreateUser> {

  Widget _body() {
    return Observer(
        builder: (_) {
      if (widget.createUserState.isLoading)
        return Center(
          child: CircularProgressIndicator(),
        );
      else
        return Container();
    }
    );

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _body()));
  }
}