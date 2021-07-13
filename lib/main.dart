import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ob_tj_day_one/car_detail//car_detail_screen.dart';
import 'package:ob_tj_day_one/car_list/car_list_screen.dart';
import 'package:ob_tj_day_one/core/provider/theme_provider.dart';
import 'package:ob_tj_day_one/home/home_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _theme = watch(themeProvider);
    return MaterialApp(
      title: 'OB Trans Jakarta',
      theme: _theme,
      // theme: ThemeData(fontFamily: 'Poppins'),
      // home: HomeScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/carList': (context) => CarListScreen(),
        '/carDetail': (context) => CarDetailScreen(),
      },
    );
  }
}