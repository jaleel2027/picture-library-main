import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:picture_library/utils/route_utilities.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Picture Library',
      getPages: RouteUtilities.getPages(),
      initialRoute: RouteUtilities.root,
      debugShowCheckedModeBanner: false,
    );
  }
}
