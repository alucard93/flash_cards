import 'package:hive/hive.dart';

part 'flash_card.model.g.dart';

@HiveType(typeId: 1)
class FlashCard {
  @HiveField(1)
  final String id;

  @HiveField(2)
  String front;

  @HiveField(3)
  String back;

  FlashCard({required this.id, required this.front, required this.back});
}
