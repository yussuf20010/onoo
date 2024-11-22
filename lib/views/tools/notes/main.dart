import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/themes/theme_constants.dart';
import '../notes/core/db/db_helper.dart';
import '../notes/ui/pages/home_page.dart';

class MyNoteApp extends StatelessWidget {
  const MyNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return AdaptiveTheme(
      light: ThemeData(
        // Use your light theme colors from AppColors
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          background: AppColors.scaffoldBackground,
        ),
      ),
      dark: ThemeData(
        // Use your dark theme colors from AppColors
        colorScheme: ColorScheme.dark(
          primary: AppColors.primary,
          background: AppColors.scaffoldBackgrounDark,
        ),
      ),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => GetMaterialApp(
        title: 'Note',
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        home: HomePage(),
      ),
    );
  }
}
