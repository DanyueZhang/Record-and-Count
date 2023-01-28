import 'package:isar/isar.dart';
import 'package:record_and_count/models/Counter.dart';
import 'package:record_and_count/models/event.dart';

class DB {
  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      // If you want to run on mobile devices or desktops,
      // install "path_provider" package and use the following lines:
      // final dir = await getApplicationSupportDirectory();
      // return await Isar.open(schemas: [EventSchema, CounterSchema], directory: dir);
      //
      // If you want to learn more, visit https://pub.dev/packages/isar/versions/2.5.0
      return await Isar.open(schemas: [EventSchema, CounterSchema]);
    }

    return Future.value(Isar.getInstance());
  }
}