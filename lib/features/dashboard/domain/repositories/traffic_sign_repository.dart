import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/traffic_sign.dart';

abstract class TrafficSignRepository {
  Future<Either<Failure, List<TrafficSign>>> getAllTrafficSign();
  Future<Either<Failure, TrafficSign>> getTrafficSignById(String id);
  Future<Either<Failure, List<TrafficSign>>> getAllTrafficSignByType(
    String type,
  );
  Future<Either<Failure, List<TrafficSign>>> getAllTrafficSignByName(
    String name,
  );
  Future<Either<Failure, List<TrafficSign>>> getAllTrafficSignByIsAdded(
    bool isAdded,
  );
  Future<Either<Failure, List<TrafficSign>>> getAllTrafficSignByIsNotAdded(
    bool isAdded,
  );
  Future<Either<Failure, List<TrafficSign>>> getAllTrafficSignByIsAddedAndType(
    bool isAdded,
    String type,
  );
}
