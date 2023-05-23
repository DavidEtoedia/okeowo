import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:okeowo/presentation/screens/main_navigation.dart';
import 'package:okeowo/presentation/utils/components/appcolor/appcolor.dart';
import 'package:okeowo/presentation/utils/helpers/navigator/navigator.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: ((context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigator.key,
            locale: DevicePreview.locale(context),
            title: 'Mizala App',
            theme: ThemeData(
                useMaterial3: true,
                scaffoldBackgroundColor: AppColors.bgColor,
                primarySwatch: Colors.blue),
            home: const MainScreen(),
            builder: (context, widget) {
              //add this line
              // ScreenUtil.setContext(context);
              return MediaQuery(
                  //Setting font does not change with system font size
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 0.98),
                  child: widget!);
            },
          );
        }));
  }
}
