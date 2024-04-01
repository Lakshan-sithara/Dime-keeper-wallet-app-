import 'package:uuid/uuid.dart';

final uuid = const Uuid().v4();

class GoalModel {
  GoalModel(
      {required this.title,
      required this.date,
      required this.progress,
      required this.target})
      : id = uuid;

  final String title;
  final DateTime date;
  final int progress;
  final int target;
  final String id;
}
