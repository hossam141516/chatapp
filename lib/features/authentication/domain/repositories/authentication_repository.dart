// lib/features/authentication/domain/repositories/authentication_repository.dart
import 'dart:async';

import 'package:blog_app/features/authentication/domain/entities/get_Name.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/error/failures.dart';
import '../entities/first_page_entity.dart';
import '../entities/sign_in_entity.dart';
import '../entities/sign_up_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, UserCredential>> signIn(SignInEntity signIn);
  Future<Either<Failure, UserCredential>> signUp(SignUpEntity signUp);
  Future<Either<Failure, UserCredential>> googleSignIn();
  FirstPageEntity firstPage();
  Future<Either<Failure, Unit>> logOut();
  Future<Either<Failure, GetNameEntity>> getName(String uid);
}
