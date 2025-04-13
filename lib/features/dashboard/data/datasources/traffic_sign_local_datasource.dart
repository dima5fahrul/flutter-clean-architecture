import 'package:hive_ce/hive.dart';

import '../models/traffic_sign_model.dart';

abstract class TrafficSignLocalDatasource {
  Future<List<TrafficSignModel>> getAllTrafficSign();
  Future<TrafficSignModel> getTrafficSignById(String id);
  Future<List<TrafficSignModel>> getAllTrafficSignByType(String type);
  Future<List<TrafficSignModel>> getAllTrafficSignByName(String name);
  Future<List<TrafficSignModel>> getAllTrafficSignByIsAdded(bool isAdded);
  Future<List<TrafficSignModel>> getAllTrafficSignByIsNotAdded(bool isAdded);
  Future<List<TrafficSignModel>> getAllTrafficSignByIsAddedAndType(
    bool isAdded,
    String type,
  );
}

class TrafficSignLocalDatasourceImpl implements TrafficSignLocalDatasource {
  final HiveInterface hive;

  TrafficSignLocalDatasourceImpl({required this.hive});

  @override
  Future<List<TrafficSignModel>> getAllTrafficSign() {
    var box = hive.box('traffic_signs');
    return box.get('getAllTrafficSign');
  }

  @override
  Future<TrafficSignModel> getTrafficSignById(String id) {
    var box = hive.box('traffic_signs');
    return box.get('getAllTrafficSignById');
  }

  @override
  Future<List<TrafficSignModel>> getAllTrafficSignByIsAdded(bool isAdded) {
    var box = hive.box('traffic_signs');
    return box.get('getAllTrafficSignByIsAdded');
  }

  @override
  Future<List<TrafficSignModel>> getAllTrafficSignByIsNotAdded(bool isAdded) {
    var box = hive.box('traffic_signs');
    return box.get('getAllTrafficSignByIsNotAdded');
  }

  @override
  Future<List<TrafficSignModel>> getAllTrafficSignByName(String name) {
    var box = hive.box('traffic_signs');
    return box.get('getAllTrafficSignByName');
  }

  @override
  Future<List<TrafficSignModel>> getAllTrafficSignByType(String type) {
    var box = hive.box('traffic_signs');
    return box.get('getAllTrafficSignByType');
  }

  @override
  Future<List<TrafficSignModel>> getAllTrafficSignByIsAddedAndType(
    bool isAdded,
    String type,
  ) {
    var box = hive.box('traffic_signs');
    return box.get('getAllTrafficSignByIsAddedAndType');
  }
}
