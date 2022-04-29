// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:clean_architecture_ess/application/repo_module.dart';
import 'package:clean_architecture_ess/domain/use_cases/users_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Home Test', () {
    final UsersUseCase state = UsersUseCase(RepoModule.userRepo());

//change the email before each run or test will fail
    test("create and delete cycle", () {
      createAndDeleteCycle(state).then(expectAsync1((value) {
        expect(value, true);
      }));
    });

//change the id before each run or test will fail get user id from https://gorest.co.in/public/v2/users
    test("test delete positive", () {
      state.deleteUser(2233).then(expectAsync1((value) {
        expect(value, true);
      }));
    });

    test("test delete negative", () async {
      await expectLater(state.deleteUser(0), completion(false));
    });

    test("test delete null handler", () async {
      await expectLater(state.deleteUser(null), completion(false));
    });

    test("create User Positive", () async {
      await expectLater(
          state.createUser(
              "Anand  Acharya 2", "Anand@cs1234.com", "male", "active"),
          completion(true));
    });

    test("create User null handler", () async {
      await expectLater(
          state.createUser(null, null, null, null), completion(false));
    });

    test("test user lisr positive", () {
      state.getAllUsers().then(expectAsync1((value) {
        expect(value.length, greaterThan(0));
      }));
    });
  });
}

//change the email before each run or test will fail
Future<bool> createAndDeleteCycle(UsersUseCase state) async {
  var response = await state.createUserwithObj(
      "Anand  Acharya 2", "Anand@123s4.com", "male", "active");

  return await state.deleteUser(response.id);
}
