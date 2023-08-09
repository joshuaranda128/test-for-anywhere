import 'package:dartz/dartz.dart';
import 'package:demo_real_estate_project/core/error/failure.dart';

typedef EitherDynamic<T> = Future<Either<Failure, T>>;

typedef UserData = Map<String, dynamic>;

typedef GoalData = Map<String, dynamic>;
