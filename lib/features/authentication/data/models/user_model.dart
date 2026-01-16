import 'package:furniture_ecommerce_app/features/authentication/domain/entities/user.dart';

class UserModel extends User {
  final String token;

  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required this.token,
  });

  factory UserModel.fromApiJson(Map<String, dynamic> json) {
    try {
      _validateResponse(json);

      final data = json['data'] as Map<String, dynamic>;
      final user = data['user'] as Map<String, dynamic>;

      return UserModel(
        id: user['id'] as int,
        name: user['name'] as String,
        email: user['email'] as String,
        token: data['token'] as String,
      );
    } catch (e) {
      throw FormatException('Failed to parse user data: ${e.toString()}');
    }
  }

  factory UserModel.fromLocalJson(Map<String, dynamic> json) {
    try {
      if (!json.containsKey('id') ||
          !json.containsKey('name') ||
          !json.containsKey('email')) {
        throw const FormatException('Invalid local user data');
      }

      return UserModel(
        id: json['id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
        token: json['token'] as String? ?? '',
      );
    } catch (e) {
      throw FormatException('Failed to parse local user data: ${e.toString()}');
    }
  }

  /// Validates the server response structure before parsing.
  ///
  /// Throws [FormatException] if the structure is invalid.
  static void _validateResponse(Map<String, dynamic> json) {
    // Validate top-level "data" field
    if (!json.containsKey('data') || json['data'] is! Map<String, dynamic>) {
      throw FormatException(
        'Invalid response: missing or invalid "data" field',
      );
    }

    final data = json['data'] as Map<String, dynamic>;

    // Validate "user" object
    if (!data.containsKey('user') || data['user'] is! Map<String, dynamic>) {
      throw FormatException(
        'Invalid response: missing or invalid "user" field',
      );
    }

    final user = data['user'] as Map<String, dynamic>;

    // Validate "token"
    if (!data.containsKey('token') || data['token'] is! String) {
      throw FormatException(
        'Invalid response: missing or invalid "token" field',
      );
    }

    // Validate user fields
    if (!user.containsKey('id') || user['id'] is! int) {
      throw FormatException(
        'Invalid response: missing or invalid "id" field',
      );
    }

    if (!user.containsKey('name') || user['name'] is! String) {
      throw FormatException(
        'Invalid response: missing or invalid "name" field',
    );
    }

    if (!user.containsKey('email') || user['email'] is! String) {
      throw FormatException(
        'Invalid response: missing or invalid "email" field',
      );
    }
  }

  /// Converts [UserModel] to JSON for local persistence.
  Map<String, dynamic> toLocalJson() {
    return {'id': id, 'name': name, 'email': email};
  }

  /// Converts [UserModel] to domain [User] entity.
  User toEntity() {
    return User(id: id, name: name, email: email);
  }

  @override
  List<Object?> get props => [id, name, email, token];
}
