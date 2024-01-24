import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:texnomart_clone_flutter/presenter/pages/dashboard/dashboard_page.dart';
import 'package:texnomart_clone_flutter/presenter/pages/map/shops_location_screen.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'data/source/local/hive_helper.dart';
import 'di/di.dart';

void main() async{
  AndroidYandexMap.useAndroidViewSurface = false;
  WidgetsFlutterBinding.ensureInitialized();
  HiveHelper.init();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const DashboardPage(currentPage: 0),
      initialRoute: "dashboard",
      routes: {
        "dashboard":(context)=> DashboardPage(currentPage: 0,),
      "allbranchesscreen":(context)=>ShopsLocationPage()},
    );
  }
}
