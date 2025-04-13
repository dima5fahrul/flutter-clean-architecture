import 'package:equatable/equatable.dart';

class TrafficSign extends Equatable {
  final String name;
  final String type;
  final String imageUrl;
  final bool isAdded;

  const TrafficSign({
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.isAdded,
  });

  @override
  List<Object> get props => [name, type, imageUrl, isAdded];
}
