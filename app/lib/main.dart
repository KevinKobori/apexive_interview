import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:nasa_apod_app/database.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';
import 'package:url_strategy/url_strategy.dart';

// Future<void> databaseInitialize() async {
//   final feature1DB =
//       await $FloorAppDatabase.databaseBuilder('feature_x.db').build();

//   final feature2DB =
//       await $FloorAppDatabase.databaseBuilder('feature_x2.db').build();

//   final personDao = feature1DB.personDao;
//   final personDao2 = feature2DB.personDao;
//   // final person = Person.create(4, 'João');
//   // final person = Person(7, 'P3');
//   const person2 = PictureEntity(8, 'P4');

//   try {
//     // await personDao.insertPerson(person);
//     await personDao2.updatePerson(person2);
//   } catch (error) {
//     log(error.toString());
//   } finally {
//     try {
//       final result = personDao.findPersonById(7);
//       final result2 = personDao2.findPersonById(person2.id);
//       result.listen((data) {
//         // log(data.toString());

//         // log(data?.id ?? '');
//         log(data?.name ?? '');
//       });
//       result2.listen((data) {
//         // log(data?.id ?? '');
//         log(data?.name ?? '');
//       });
//     } catch (error) {
//       log(error.toString());
//     } finally {}
//   }
// }

// late ObjectBox objectbox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await ScreenUtil.ensureScreenSize();
  // objectbox = await ObjectBox.create();

  setPathUrlStrategy();

  await _startSingletons();
  // await databaseInitialize();

  runApp(
    ModularApp(
      module: MainModule(),
      child: const MainWidget(),
    ),
  );
}

Future<void> _startSingletons() async {
  await ApodDotEnv.initialize();
}
