// lib/features/authentication/data/models/get_name_model.dart
import 'package:blog_app/features/authentication/domain/entities/get_name.dart';

class GetNameModel extends GetNameEntity {
  GetNameModel({required String name}) : super(name: name);

  factory GetNameModel.fromJson(Map<String, dynamic> json) {
    return GetNameModel(name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}
