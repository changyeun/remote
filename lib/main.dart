import 'package:crypto_ui_web/constant/constants.dart';
import 'package:crypto_ui_web/screen/main_view.dart';
import 'package:crypto_ui_web/services/home_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  //비동기로 데이터를 다룬다음 runapp할 경우 사용
  WidgetsFlutterBinding.ensureInitialized();

  /// firebase, supabase 연동

  await Future.wait([
    Supabase.initialize(
      url: 'https://bsqtkmycdqpdfdrdevmu.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJzcXRrbXljZHFwZGZkcmRldm11Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjY3NDA2NjksImV4cCI6MjA0MjMxNjY2OX0.3hU3cPv3e66m70ViZxWVxHwlcHB_9dXB9rRO0JJfuDI',
    )
  ]);

  if (kIsWeb) {
    runApp(
      MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // AuthService authService = Get.find();

  @override
  void initState() {
    super.initState();
    // authService.watchAuthChange();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Remote Island',
        // builder: EasyLoading.init(),
        theme: ThemeData(
          // fontFamily: 'NotoSansKR',
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          // primarySwatch: createMaterialColor(Color(Constants.defaultColor)),
        ),
        home: const MainView(),
        initialRoute: '/',
        getPages: [
          GetPage(name: "/", page: () => const MainView()),
        ],
        initialBinding: BindingsBuilder(() {
          Get.put(HomeService());
        })
    );
  }
}
