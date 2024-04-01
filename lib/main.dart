import 'package:flutter/material.dart';
import 'package:learing_provider/provider/auth_provider.dart';
import 'package:learing_provider/provider/favorite_provider.dart';
import 'package:learing_provider/provider/slider_provider.dart';
import 'package:learing_provider/provider/theme_provider.dart';
import 'package:learing_provider/screens/favorite/all_item_screen.dart';
import 'package:learing_provider/screens/favorite/login_screen.dart';
import 'package:learing_provider/screens/slider_screen.dart';
import 'package:learing_provider/screens/time_screen.dart';
import 'package:learing_provider/provider/time_provider.dart';
import 'package:learing_provider/screens/value_notify_listener.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TimeProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Builder(builder: (context) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const LoginScreen(),
          themeMode: themeProvider.themeMode,
          theme: ThemeData(
            useMaterial3: false,
          ),
          darkTheme: ThemeData(
            useMaterial3: false,
            brightness: Brightness.dark,
            appBarTheme: const AppBarTheme(color: Colors.teal),
          ),
        );
      }),
    );
  }
}
