import 'package:hive/hive.dart';

part 'deck.model.g.dart';

@HiveType(typeId: 0)
class Deck {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String name;

  Deck({required this.id, required this.name});
}
