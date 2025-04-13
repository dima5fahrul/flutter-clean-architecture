import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/traffic_sign_model.dart';

abstract class TrafficSignRemoteDatasource {
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

class TrafficSignRemoteDatasourceImpl implements TrafficSignRemoteDatasource {
  final CollectionReference<Map<String, dynamic>> collection;

  TrafficSignRemoteDatasourceImpl(this.collection);

  @override
  Future<List<TrafficSignModel>> getAllTrafficSign() async {
    var querySnapshot = await collection.get();
    return TrafficSignModel.fromList(querySnapshot.docs);
  }

  @override
  Future<TrafficSignModel> getTrafficSignById(String id) async {
    var querySnapshot = await collection.where('id', isEqualTo: id).get();
    return TrafficSignModel.fromList(querySnapshot.docs).first;
  }

  @override
  Future<List<TrafficSignModel>> getAllTrafficSignByIsAdded(
    bool isAdded,
  ) async {
    var querySnapshot =
        await collection.where('isAdded', isEqualTo: isAdded).get();
    return TrafficSignModel.fromList(querySnapshot.docs);
  }

  @override
  Future<List<TrafficSignModel>> getAllTrafficSignByIsNotAdded(
    bool isAdded,
  ) async {
    var querySnapshot =
        await collection.where('isAdded', isEqualTo: !isAdded).get();
    return TrafficSignModel.fromList(querySnapshot.docs);
  }

  @override
  Future<List<TrafficSignModel>> getAllTrafficSignByName(String name) async {
    var querySnapshot = await collection.where('name', isEqualTo: name).get();
    return TrafficSignModel.fromList(querySnapshot.docs);
  }

  @override
  Future<List<TrafficSignModel>> getAllTrafficSignByType(String type) async {
    var querySnapshot = await collection.where('type', isEqualTo: type).get();
    return TrafficSignModel.fromList(querySnapshot.docs);
  }

  @override
  Future<List<TrafficSignModel>> getAllTrafficSignByIsAddedAndType(
    bool isAdded,
    String type,
  ) async {
    var querySnapshot =
        await collection
            .where('isAdded', isEqualTo: isAdded)
            .where('type', isEqualTo: type)
            .get();
    return TrafficSignModel.fromList(querySnapshot.docs);
  }
}
