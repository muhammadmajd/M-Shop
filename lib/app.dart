
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder/bindings/general_bindinds.dart';
import 'package:tinder/routes/app_routes.dart';
import 'package:tinder/utils/constents/colors.dart';
import 'package:tinder/utils/theme/theme.dart';


class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: TAppTheme.darkTheme,
      title: 'Flutter Demo',
      theme: TAppTheme.lightTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      /// Show Loader or Circular Progress Indicator meanwhile Authentication Repository is deciding to show relevant screen.
      home: const Scaffold(backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator (color: Colors .white))),
     //home: const OnBoardingScreen(),
     // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
