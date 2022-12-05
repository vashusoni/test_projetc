import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:testprojetc/app/login/services/login_services.dart';

import 'app/login/view/login_screen.dart';
import 'app/product/services/product_services.dart';
import 'app/splash/view/splash_screen.dart';
import 'app/utils/size_config.dart';
import 'app/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return LayoutBuilder(builder: (context, con) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(con, orientation);
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => LoginService()),
            ChangeNotifierProvider(create: (_) => ProductServices()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: appThemeData(),
            home: const SplashScreen(),
          ),
        );
      });
    });
  }
}
