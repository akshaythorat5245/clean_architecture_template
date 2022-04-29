// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createuserstate.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateUserState on CreateUserStateBase, Store {
  final _$isLoadingAtom = Atom(name: 'CreateUserStateBase.isLoading');

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

  final _$isSucessAtom = Atom(name: 'CreateUserStateBase.isSucess');

  @override
  bool get isSucess {
    _$isSucessAtom.reportRead();
    return super.isSucess;
  }

  @override
  set isSucess(bool value) {
    _$isSucessAtom.reportWrite(value, super.isSucess, () {
      super.isSucess = value;
    });
  }

  final _$createUserAsyncAction = AsyncAction('CreateUserStateBase.createUser');

  @override
  Future<bool> createUser() {
    return _$createUserAsyncAction.run(() => super.createUser());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isSucess: ${isSucess}
    ''';
  }
}
