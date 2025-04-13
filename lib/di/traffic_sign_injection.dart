import '../features/dashboard/data/datasources/traffic_sign_remote_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void trafficSignInjection() {
  // Registering the TrafficSignRemoteDatasource
  getIt.registerLazySingleton<TrafficSignRemoteDatasource>(
    () => TrafficSignRemoteDatasourceImpl(
      FirebaseFirestore.instance.collection('traffic_signs'),
    ),
  );

  // Registering the TrafficSignLocalDatasource
  // getIt.registerLazySingleton<TrafficSignLocalDatasource>(
  //   () => TrafficSignLocalDatasourceImpl(
  //     box: getIt.get<HiveInterface>().box<List<TrafficSignModel>>(
  //       'traffic_signs',
  //     ),
  //   ),
  // );
}
