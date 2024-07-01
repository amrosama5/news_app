import 'package:flutter/material.dart';
import 'package:news_app_api/provider/my_provider.dart';
import 'package:news_app_api/screens/settings_screen.dart';
import 'package:provider/provider.dart';
import 'layout/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider()..loadTheme(),
      child: const MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      themeMode: provider.theme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(context) => const HomeScreen(),
        SettingsScreen.routeName:(context) =>  const SettingsScreen(),
      },
    );
  }
}
