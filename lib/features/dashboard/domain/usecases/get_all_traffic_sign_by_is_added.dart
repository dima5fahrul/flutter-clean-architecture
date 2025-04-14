import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/traffic_sign.dart';
import '../repositories/traffic_sign_repository.dart';

class GetAllTrafficSignByIsAdded {
  final TrafficSignRepository _trafficSignRepository;

  GetAllTrafficSignByIsAdded(this._trafficSignRepository);

  Future<Either<Failure, List<TrafficSign>>> execute(bool isAdded) async {
    return await _trafficSignRepository.getAllTrafficSignByIsAdded(isAdded);
  }
}
