import 'package:ecommerce/nointernet/dependency_injection.dart';
import 'package:ecommerce/splash/splash_page.dart';
import 'package:ecommerce/theme/themeprovider.dart';
import 'package:ecommerce/theme/thmedata.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(const MyApp());
  DependencyInjection.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeProvider = ThemeProvider();
  void getPreference() async {
    themeProvider.darkTheme =
        await themeProvider.themePreference.getDarkTheme();
    themeProvider.newProducts =
        await themeProvider.themePreference.getNewProducts();
    themeProvider.topProducts =
        await themeProvider.themePreference.getTopProducts();
  }

  @override
  void initState() {
    super.initState();
    getPreference();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => themeProvider,
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) => GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: Style.themeData(value.darkTheme, context),
          home: const MySplashPage(),
        ),
      ),
    );
  }
}
