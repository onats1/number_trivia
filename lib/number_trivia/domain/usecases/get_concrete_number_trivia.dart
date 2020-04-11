import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:numbertrivia/core/errors/failures.dart';
import 'package:numbertrivia/core/usecases/usecase.dart';
import 'package:numbertrivia/number_trivia/domain/entities/number_trivia.dart';
import 'package:numbertrivia/number_trivia/domain/repositories/num_trivia_repo.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository numRepo;

  GetConcreteNumberTrivia(this.numRepo);

  @override
  Future<Either<Failures, NumberTrivia>> call(Params param) async {
    return await numRepo.getConcreteNumberTrivia(param.number);
  }
}

class Params extends Equatable {
  final int number;

  Params({this.number}) : super([number]);
}
