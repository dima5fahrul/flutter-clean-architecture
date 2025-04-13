import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/traffic_sign.dart';
import '../repositories/traffic_sign_repository.dart';

class GetAllTrafficSignByName {
  final TrafficSignRepository repository;

  GetAllTrafficSignByName(this.repository);

  Future<Either<Failure, List<TrafficSign>>> call(String name) async {
    return await repository.getAllTrafficSignByName(name);
  }
}
