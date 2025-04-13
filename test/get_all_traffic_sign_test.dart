import 'package:clean_architecture/features/dashboard/data/datasources/traffic_sign_remote_datasource.dart';
import 'package:clean_architecture/features/dashboard/data/models/traffic_sign_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([TrafficSignRemoteDatasource])
import 'get_all_traffic_sign_test.mocks.dart';

void main() {
  late MockTrafficSignRemoteDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockTrafficSignRemoteDatasource();
  });

  // Arrange
  final mockData = [
    TrafficSignModel(
      name: 'Stop Sign',
      type: 'Regulatory',
      imageUrl: 'https://example.com/stop_sign.png',
      isAdded: true,
    ),
    TrafficSignModel(
      name: 'Yield Sign',
      type: 'Regulatory',
      imageUrl: 'https://example.com/yield_sign.png',
      isAdded: false,
    ),
  ];

  test('should return list of traffic signs', () async {
    when(mockDatasource.getAllTrafficSign()).thenAnswer((_) async => mockData);

    // Act
    final result = await mockDatasource.getAllTrafficSign();

    // Print output ke console
    for (var sign in result) {
      debugPrint('Sign: ${sign.name} - ${sign.type}');
    }

    // Assert
    expect(result, mockData);
    verify(mockDatasource.getAllTrafficSign()).called(1);
  });

  test('shouldn`t return name of traffic sign', () async {
    when(
      mockDatasource.getAllTrafficSignByName("Unknown"),
    ).thenAnswer((_) async => []);

    // Act
    final result = await mockDatasource.getAllTrafficSignByName("Unknown");

    // Print output ke console
    for (var sign in result) {
      debugPrint('Sign: ${sign.name} - ${sign.type}');
    }

    // Assert
    expect(result, []);
    verify(mockDatasource.getAllTrafficSignByName("Unknown")).called(1);
  });
}
