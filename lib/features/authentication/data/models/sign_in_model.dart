//lib/features/authentication/data/models/sign_in_model.dart
import '../../domain/entities/sign_in_entity.dart';

class SignInModel extends SignInEntity {
  const SignInModel({required String email, required String password})
      : super(email: email, password: password);
}
