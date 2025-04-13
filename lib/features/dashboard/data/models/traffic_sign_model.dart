import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/traffic_sign.dart';

class TrafficSignModel extends TrafficSign {
  final String? id;

  const TrafficSignModel({
    this.id,
    required super.name,
    required super.type,
    required super.imageUrl,
    required super.isAdded,
  });

  factory TrafficSignModel.fromJson(Map<String, dynamic> json) {
    return TrafficSignModel(
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      isAdded: json['isAdded'] ?? false,
    );
  }

  static TrafficSignModel fromSnap({
    required DocumentSnapshot<Map<String, dynamic>> docSnap,
    String? id,
  }) {
    final data = docSnap.data()!;
    return TrafficSignModel(
      id: id,
      name: data['name'] ?? '',
      type: data['type'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      isAdded: data['isAdded'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'imageUrl': imageUrl,
      'isAdded': isAdded,
    };
  }

  static List<TrafficSignModel> fromList(
    List<DocumentSnapshot<Map<String, dynamic>>> list,
  ) {
    if (list.isEmpty) {
      return [];
    }

    return list
        .map(
          (docSnap) =>
              TrafficSignModel.fromSnap(docSnap: docSnap, id: docSnap.id),
        )
        .toList();
  }
}
