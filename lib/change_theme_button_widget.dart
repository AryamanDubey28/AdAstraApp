import 'package:firebase_attempt/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
        value: themeProvider.isDarkMode,
        onChanged: (value) {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          provider.toggleTheme(value);
        });
  }
}

// class DeviceThemeButtonWidget extends StatelessWidget {
//   const DeviceThemeButtonWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     return Container(
//       width: 30,
//       height: 30,
//       child: CheckboxListTile(
//           value: themeProvider.isSystemThemeMode,
//           onChanged: (value) {
//             final provider = Provider.of<ThemeProvider>(context, listen: false);
//             provider.setSystemTheme();
//           }),
//     );
  
//   }
// }
