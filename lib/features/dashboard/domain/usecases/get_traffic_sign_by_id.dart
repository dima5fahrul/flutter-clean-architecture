import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/traffic_sign.dart';
import '../repositories/traffic_sign_repository.dart';

class GetTrafficSignById {
  final TrafficSignRepository repository;

  GetTrafficSignById(this.repository);

  Future<Either<Failure, TrafficSign>> execute(String id) async {
    return await repository.getTrafficSignById(id);
  }
}
