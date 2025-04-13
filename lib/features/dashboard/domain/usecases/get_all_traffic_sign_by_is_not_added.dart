import '../../../../core/error/failure.dart';
import '../entities/traffic_sign.dart';
import '../repositories/traffic_sign_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllTrafficSignByIsNotAdded {
  final TrafficSignRepository _trafficSignRepository;

  GetAllTrafficSignByIsNotAdded(this._trafficSignRepository);

  Future<Either<Failure, List<TrafficSign>>> execute(bool isAdded) async {
    return await _trafficSignRepository.getAllTrafficSignByIsNotAdded(isAdded);
  }
}
