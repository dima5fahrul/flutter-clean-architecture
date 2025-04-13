import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/traffic_sign.dart';
import '../repositories/traffic_sign_repository.dart';

class GetAllTrafficSignByType {
  final TrafficSignRepository repository;

  const GetAllTrafficSignByType(this.repository);

  Future<Either<Failure, List<TrafficSign>>> execute(String type) async {
    return await repository.getAllTrafficSignByType(type);
  }
}
