import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetNameUseCase {
  final AuthenticationRepository repository;

  GetNameUseCase({required this.repository});

  Future<Either<Failure, String>> call() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final result = await repository.getName(uid);

    return result.fold(
      (failure) => Left(failure),
      (getNameEntity) => Right(getNameEntity.name),
    );
  }
}
