import 'package:ecommerce/screen/home/main_page.dart';
import 'package:ecommerce/theme/themeprovider.dart';
import 'package:ecommerce/theme/thmedata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeProvider = ThemeProvider();
  void getDarkTheme() async {
    themeProvider.darkTheme =
        await themeProvider.themePreference.getDarkTheme();
  }

  @override
  void initState() {
    super.initState();
    getDarkTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => themeProvider,
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: Style.themeData(value.darkTheme, context),
          home: const MyMainPage(),
        ),
      ),
    );
  }
}
