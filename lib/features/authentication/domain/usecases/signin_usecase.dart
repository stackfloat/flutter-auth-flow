import 'package:furniture_ecommerce_app/core/usecases/usecase.dart';
import 'package:furniture_ecommerce_app/core/utils/typedef.dart';
import 'package:furniture_ecommerce_app/features/authentication/domain/entities/user.dart';
import 'package:furniture_ecommerce_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:furniture_ecommerce_app/features/authentication/domain/value_objects/email.dart';
import 'package:furniture_ecommerce_app/features/authentication/domain/value_objects/password.dart';

class SigninUseCase implements UseCase<User, SigninParams> {
  final AuthRepository repository;
  
  SigninUseCase(this.repository);
  
  @override
  ResultFuture<User> call(SigninParams params) async {
    return repository.login(params.email.value, params.password.value);
  }
}

class SigninParams {
  final Email email;
  final Password password;
  
  const SigninParams({
    required this.email,
    required this.password,
  });
}

