import 'package:equatable/equatable.dart';

class FirstPageEntity extends Equatable {
  final bool isLoggedIn;

  const FirstPageEntity({required this.isLoggedIn});

  @override
  List<Object?> get props => [isLoggedIn];
}
