import 'package:expence_master/models/expence.dart';
import 'package:hive/hive.dart';

class CategoryAdapter extends TypeAdapter<Chatagary> {
  @override
  final int typeId = 2; // Choose a unique typeId for your enum

  @override
  Chatagary read(BinaryReader reader) {
    return Chatagary.values[reader.readByte()];
  }

  @override
  void write(BinaryWriter writer, Chatagary obj) {
    writer.writeByte(obj.index);
  }
}