//lib/features/authentication/data/models/first_page_model.dart
import 'package:blog_app/features/authentication/domain/entities/first_page_entity.dart';

class FirstPageModel extends FirstPageEntity {
  const FirstPageModel({required bool isLoggedIn})
      : super(isLoggedIn: isLoggedIn);
}
