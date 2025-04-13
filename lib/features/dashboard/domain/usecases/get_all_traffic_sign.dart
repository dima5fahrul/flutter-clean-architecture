import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/traffic_sign.dart';
import '../repositories/traffic_sign_repository.dart';

class GetAllTrafficSign {
  final TrafficSignRepository repository;

  GetAllTrafficSign(this.repository);

  Future<Either<Failure, List<TrafficSign>>> execute() async {
    return await repository.getAllTrafficSign();
  }
}
