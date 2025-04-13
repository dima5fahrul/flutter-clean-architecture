import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_ce/hive.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/traffic_sign.dart';
import '../../domain/repositories/traffic_sign_repository.dart';
import '../datasources/traffic_sign_local_datasource.dart';
import '../datasources/traffic_sign_remote_datasource.dart';
import '../models/traffic_sign_model.dart';

class TrafficSignRepositoryImpl extends TrafficSignRepository {
  final TrafficSignRemoteDatasource remoteDatasource;
  final TrafficSignLocalDatasource localDatasource;
  final Connectivity connectivity;
  final HiveInterface hive;
  TrafficSignRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
    required this.connectivity,
    required this.hive,
  });

  @override
  Future<Either<Failure, List<TrafficSign>>> getAllTrafficSign() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        List<TrafficSignModel> result =
            await localDatasource.getAllTrafficSign();
        return Right(result);
      }

      List<TrafficSignModel> result =
          await remoteDatasource.getAllTrafficSign();
      var box = hive.box('traffic_signs');
      box.put("getAllTrafficSign", result);

      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TrafficSign>>> getAllTrafficSignByIsAdded(
    bool isAdded,
  ) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        List<TrafficSignModel> result = await localDatasource
            .getAllTrafficSignByIsAdded(isAdded);
        return Right(result);
      }

      List<TrafficSignModel> result = await remoteDatasource
          .getAllTrafficSignByIsAdded(isAdded);
      var box = hive.box('traffic_signs');
      box.put("getAllTrafficSignByIsAdded", result);

      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TrafficSign>>> getAllTrafficSignByIsAddedAndType(
    bool isAdded,
    String type,
  ) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        List<TrafficSignModel> result = await localDatasource
            .getAllTrafficSignByIsAddedAndType(isAdded, type);
        return Right(result);
      }

      List<TrafficSignModel> result = await remoteDatasource
          .getAllTrafficSignByIsAddedAndType(isAdded, type);
      var box = hive.box('traffic_signs');
      box.put("getAllTrafficSignByIsAddedAndType", result);

      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TrafficSign>>> getAllTrafficSignByIsNotAdded(
    bool isAdded,
  ) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        List<TrafficSignModel> result = await localDatasource
            .getAllTrafficSignByIsNotAdded(isAdded);
        return Right(result);
      }

      List<TrafficSignModel> result = await remoteDatasource
          .getAllTrafficSignByIsNotAdded(isAdded);
      var box = hive.box('traffic_signs');
      box.put("getAllTrafficSignByIsNotAdded", result);

      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TrafficSign>>> getAllTrafficSignByName(
    String name,
  ) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        List<TrafficSignModel> result = await localDatasource
            .getAllTrafficSignByName(name);
        return Right(result);
      }

      List<TrafficSignModel> result = await remoteDatasource
          .getAllTrafficSignByName(name);
      var box = hive.box('traffic_signs');
      box.put("getAllTrafficSignByName", result);

      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TrafficSign>>> getAllTrafficSignByType(
    String type,
  ) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        List<TrafficSignModel> result = await localDatasource
            .getAllTrafficSignByType(type);
        return Right(result);
      }

      List<TrafficSignModel> result = await remoteDatasource
          .getAllTrafficSignByType(type);
      var box = hive.box('traffic_signs');
      box.put("getAllTrafficSignByType", result);

      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TrafficSign>> getTrafficSignById(String id) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        TrafficSignModel result = await localDatasource.getTrafficSignById(id);
        return Right(result);
      }

      TrafficSignModel result = await remoteDatasource.getTrafficSignById(id);
      var box = hive.box('traffic_signs');
      box.put("getTrafficSignById", result);

      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
