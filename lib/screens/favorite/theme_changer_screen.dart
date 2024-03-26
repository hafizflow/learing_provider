import 'package:flutter/material.dart';
import 'package:learing_provider/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeChangerScreen extends StatelessWidget {
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer Screen'),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: const Text('Light Theme'),
            value: ThemeMode.light,
            groupValue: themeProvider.themeMode,
            onChanged: themeProvider.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark Theme'),
            value: ThemeMode.dark,
            groupValue: themeProvider.themeMode,
            onChanged: themeProvider.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('System Theme'),
            value: ThemeMode.system,
            groupValue: themeProvider.themeMode,
            onChanged: themeProvider.setTheme,
          ),
        ],
      ),
    );
  }
}
