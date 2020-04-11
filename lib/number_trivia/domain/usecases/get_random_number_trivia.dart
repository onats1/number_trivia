
import 'package:dartz/dartz.dart';
import 'package:numbertrivia/core/errors/failures.dart';
import 'package:numbertrivia/core/usecases/usecase.dart';
import 'package:numbertrivia/number_trivia/domain/entities/number_trivia.dart';
import 'package:numbertrivia/number_trivia/domain/repositories/num_trivia_repo.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams>{

  NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failures, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }

}

