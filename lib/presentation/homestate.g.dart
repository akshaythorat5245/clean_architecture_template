// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homestate.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeState on HomeStateBase, Store {
  final _$solarActivitiesAtom = Atom(name: 'HomeStateBase.solarActivities');

  final _$isLoadingAtom = Atom(name: 'HomeStateBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$userListAtom = Atom(name: 'HomeStateBase.userList');

  @override
  List<User> get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(List<User> value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  final _$getUserListAsyncAction = AsyncAction('HomeStateBase.getUserList');

  @override
  Future<void> getUserList() {
    return _$getUserListAsyncAction.run(() => super.getUserList());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
userList: ${userList}
    ''';
  }
}
