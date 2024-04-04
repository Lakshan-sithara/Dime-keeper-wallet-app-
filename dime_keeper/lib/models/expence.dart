//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';

part 'expence.g.dart';

//create a unique id using uuid
final uuid = const Uuid().v4();

//date formatter
final formattedDate = DateFormat.yMd();

//enum chatagary
enum Chatagary { food, travel, work, leasure }

//catagary icons
final categaryIcons = {
  Chatagary.food: Icons.lunch_dining,
  Chatagary.leasure: Icons.leak_add,
  Chatagary.travel: Icons.train,
  Chatagary.work: Icons.work
};

@HiveType(typeId: 1)
class ExpenceModel {
  //constructor
  ExpenceModel(
      {required this.amount,
      required this.title,
      required this.date,
      required this.categary})
      : id = uuid;

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double amount;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final Chatagary categary;

  //getter > formatted date
  String get getFormattedDate {
    return formattedDate.format(date);
  }
}


