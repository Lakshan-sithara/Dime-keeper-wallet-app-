import 'package:hive/hive.dart';

import '../models/expence.dart';

class Database {
  //crate a database reference
  final _myBox = Hive.box('expenceDatabase');

  List<ExpenceModel> expenceList = [];

  //create the init expence list function

  void createInitialDatabase() {
    expenceList = [
      ExpenceModel(
          amount: 12.4,
          title: "footBall",
          date: DateTime.now(),
          categary: Chatagary.leasure),
      ExpenceModel(
          amount: 25,
          title: "bus",
          date: DateTime.now(),
          categary: Chatagary.travel),
      ExpenceModel(
          amount: 30,
          title: "carrot",
          date: DateTime.now(),
          categary: Chatagary.food),
      ExpenceModel(
          amount: 20,
          title: 'bag',
          date: DateTime.now(),
          categary: Chatagary.travel),
    ];
  }

  //load data
  void loadData() {
    final dynamic data = _myBox.get('EXP_DATA');

    //validate the data
    if (data != null && data is List<dynamic>) {
      expenceList = data.cast<ExpenceModel>().toList();
    }
  }

  //update data
  Future<void> updateData() async {
    await _myBox.put('EXP_DATA', expenceList);
    print('data saved');
  }
}
