import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:twenty_store/common/utils/app_routes.dart';
import 'package:twenty_store/common/utils/environment.dart';
import 'package:twenty_store/common/utils/kstrings.dart';
import 'package:twenty_store/src/categories/controllers/category_notifier.dart';
import 'package:twenty_store/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:twenty_store/src/home/controllers/home_tabs_notifier.dart';
import 'package:twenty_store/src/onboarding/controller/onboarding_controller.dart';
import 'package:twenty_store/src/splash_screen/views/splashscreen_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: Environment.fileName);
  GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OnboardingNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => TabIndexNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeTabsNotifier(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: screenSize,
      minTextAdapt: true,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppText.kAppName,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: router,
        );
      },
      child: const SplashScreenPage(),
    );
  }
}
