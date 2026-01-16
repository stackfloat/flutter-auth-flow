import 'package:furniture_ecommerce_app/core/services/network/dio_client.dart';
import 'package:furniture_ecommerce_app/core/utils/typedef.dart';
import 'package:furniture_ecommerce_app/features/authentication/data/models/user_model.dart';

/// Remote data source for authentication operations.
///
/// Returns [UserModel] (data layer) which will be converted to [User] entity
/// by the repository (domain layer).
///
abstract class AuthRemoteDataSource {
  /// Sign up a new user with name, email, and password.
  /// Returns [UserModel] with user data and auth token.
  ResultFuture<UserModel> signup(String name, String email, String password);

  /// Log in an existing user with email and password.
  /// Returns [UserModel] with user data and auth token.
  ResultFuture<UserModel> login(String email, String password);

  /// Log out the current user.
  /// Invalidates the auth token on the server.
  ResultFuture<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _dioClient;

  AuthRemoteDataSourceImpl(this._dioClient);

  @override
  ResultFuture<UserModel> signup(String name, String email, String password) {
    return _dioClient.post(
      '/register',
      data: {'name': name, 'email': email, 'password': password},
      parser: (data) => UserModel.fromApiJson(data),
    );
  }

  @override
  ResultFuture<UserModel> login(String email, String password) {
    return _dioClient.post(
      '/login',
      data: {'email': email, 'password': password},
      parser: (data) => UserModel.fromApiJson(data),
    );
  }

  @override
  ResultFuture<void> logout() {
    return _dioClient.post<void>('/logout', parser: (_) {});
  }
}
