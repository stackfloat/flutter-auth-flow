

import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:furniture_ecommerce_app/features/authentication/data/models/user_model.dart';

void main() {
  final UserModel userModel = UserModel(id: 1, name: 'John Doe', email: 'john.doe@example.com', token: 'token');


  test('should return a [User] when the JSON is valid', () {
    final json = {
      'id': 1,
      'name': 'John Doe',
      'email': 'john.doe@example.com',
      'token': 'token',
    };

    final result = UserModel.fromJson(json);

    expect(result, userModel);
  });

  
  test('should return valid model from json', () async {

    final file = File('test/fixtures/user.json');
    final json = jsonDecode(await file.readAsString());
    final result = UserModel.fromJson(json);

    expect(result, isA<UserModel>());
  });
}