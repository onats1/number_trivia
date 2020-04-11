import 'package:dartz/dartz.dart';
import 'package:numbertrivia/core/errors/failures.dart';
import 'package:numbertrivia/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failures, NumberTrivia>> getConcreteNumberTrivia(int number);

  Future<Either<Failures, NumberTrivia>> getRandomNumberTrivia();
}
