import 'package:alqurani/data/location.dart';
import 'package:alqurani/data/themes.dart';
import 'package:alqurani/data/uistate.dart';
import 'package:alqurani/ui/about.dart';
import 'package:alqurani/ui/compass.dart';
import 'package:alqurani/ui/home.dart';
import 'package:alqurani/ui/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => UiState()),
      ChangeNotifierProvider(create: (_) => ThemeNotifier()),
      ChangeNotifierProvider(create: (_) => LocationNotifier()),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'I_QRAA',
      theme: Provider.of<ThemeNotifier>(context).curretThemeData,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/settings': (context) => Settings(),
        '/about': (context) => About(),
        '/Qiblah': (context) => Compass(),
      },
    );
  }
}
