import 'package:furniture_ecommerce_app/features/authentication/data/models/user_model.dart';
import 'package:furniture_ecommerce_app/features/authentication/domain/entities/user.dart';
import 'package:furniture_ecommerce_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  final userModel = UserModel(
    id: 1,
    name: 'John Doe',
    email: 'john.doe@example.com',
    token: 'token',
  );

  test('UserModel should be a subclass of User', () {
    // Assert
    expect(userModel, isA<User>());
  });
}
