import 'package:equatable/equatable.dart';

class GetNameEntity extends Equatable {
  final String name;

  const GetNameEntity({required this.name});

  @override
  List<Object?> get props => [name];
}
