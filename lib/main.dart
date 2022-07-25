import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:sqlflite_crud/utils/database_helper.dart';
import 'package:sqlflite_crud/utils/navigation_utils/navigation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = await initDatabase;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.home,
          getPages: Routes.route,
        );
      },
    );
  }
}
