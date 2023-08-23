import 'package:hive/hive.dart';
import 'package:jiffy/jiffy.dart';

class JiffyAdapter extends TypeAdapter<Jiffy> {
  @override
  final typeId = 36;

  @override
  Jiffy read(BinaryReader reader) {
    final micros = reader.readInt();
    try {
      return Jiffy.unixFromMillisecondsSinceEpoch(micros);
    } catch (e) {
      return Jiffy();
    }
    //.dateTime.fromMicrosecondsSinceEpoch(micros);
    //return Jiffy(reader.readString());
    /*final micros = reader.readInt();
    return DateTime.fromMicrosecondsSinceEpoch(micros);*/
  }

  @override
  void write(BinaryWriter writer, Jiffy obj) {
    writer.writeInt(obj.unix());
  }
}
