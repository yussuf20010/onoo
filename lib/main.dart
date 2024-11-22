// import 'package:flutter/material.dart';
// import 'package:adaptive_theme/adaptive_theme.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:loader_overlay/loader_overlay.dart';
// import 'package:news_pro/views/tools/notes/core/db/db_helper.dart';
// import 'config/wp_config.dart';
// import 'core/ads/ad_id_provider.dart';
// import 'core/localization/app_locales.dart';
// import 'core/routes/app_routes.dart';
// import 'core/routes/on_generate_route.dart';
// import 'core/themes/theme_constants.dart';
// import 'core/utils/app_utils.dart';
// import 'package:optimize_battery/optimize_battery.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await EasyLocalization.ensureInitialized();
//   AppUtil.setDisplayToHighRefreshRate();
//   final savedThemeMode = await AdaptiveTheme.getThemeMode();
//
//   // Note
//   await DBHelper.initDb();
//   //////////////
//
//   // Chat
//   await Firebase.initializeApp();
//   //////////////
//
//   // Pawns SDK
//   OptimizeBattery.stopOptimizingBatteryUsage();
//   const MethodChannel channel = MethodChannel('sharingBand');
//   channel.invokeMethod('startSharing');
//   //////////////
//
//
//   final versionChecker = VersionChecker('1.4.0');
//   final requiresUpdate = await versionChecker.isUpdateRequired();
//
//   runApp(
//     ProviderScope(
//       child: EasyLocalization(
//         supportedLocales: AppLocales.supportedLocales,
//         path: 'assets/translations',
//         startLocale: AppLocales.english,
//         fallbackLocale: AppLocales.english,
//         child: requiresUpdate
//             ? UpdateRequiredApp()
//             : NewsProApp(savedThemeMode: savedThemeMode),
//       ),
//     ),
//   );
// }
//
//
// class NewsProApp extends StatelessWidget {
//   const NewsProApp({Key? key, this.savedThemeMode}) : super(key: key);
//   final AdaptiveThemeMode? savedThemeMode;
//
//   @override
//   Widget build(BuildContext context) {
//     return AdaptiveTheme(
//       light: AppTheme.lightTheme,
//       dark: AppTheme.darkTheme,
//       initial: savedThemeMode ?? AdaptiveThemeMode.system,
//       builder: (theme, darkTheme) => GlobalLoaderOverlay(
//         child: MaterialApp(
//           title: WPConfig.appName,
//           localizationsDelegates: context.localizationDelegates,
//           supportedLocales: context.supportedLocales,
//           locale: context.locale,
//           theme: theme,
//           darkTheme: darkTheme,
//           onGenerateRoute: RouteGenerator.onGenerate,
//           initialRoute: AppRoutes.initial,
//           onUnknownRoute: (_) => RouteGenerator.errorRoute(),
//           debugShowCheckedModeBanner: false,
//         ),
//       ),
//     );
//   }
// }
//
// class UpdateRequiredApp extends StatelessWidget {
//   const UpdateRequiredApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(Icons.update,
//                   size: 80, color: Colors.red), // An update icon
//               Text('force_update_required'.tr(),
//                 style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               Text('force_update_message'.tr(),
//                 style: const TextStyle(fontSize: 16, color: Colors.grey),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   const playStoreUrl = 'https://play.google.com/store/apps/details?id=com.onoo.app';
//                   // Launch the Play Store with the app's package name
//                   launch(playStoreUrl);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF00C897), // Background color
//                   padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15), // Adjust the radius as needed
//                   ),
//                 ),
//                 child: Text('update_now'.tr(),
//                   style: const TextStyle(
//                     color: Colors.white, // Text color
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class VersionChecker {
//   final String latestAppVersion;
//
//   VersionChecker(this.latestAppVersion);
//
//   Future<bool> isUpdateRequired() async {
//     final packageInfo = await PackageInfo.fromPlatform();
//     final installedVersion = packageInfo.version;
//     return installedVersion != latestAppVersion;
//   }
// }
//
//
//
//
//
//

import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:news_pro/views/tools/notes/core/db/db_helper.dart';
import 'config/wp_config.dart';
import 'core/ads/ad_id_provider.dart';
import 'core/localization/app_locales.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/on_generate_route.dart';
import 'core/themes/theme_constants.dart';
import 'core/utils/app_utils.dart';
import 'package:optimize_battery/optimize_battery.dart';
// import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  AppUtil.setDisplayToHighRefreshRate();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  // Note
  await DBHelper.initDb();
  //////////////

  // Chat
  await Firebase.initializeApp();
  //////////////

  // Pawns SDK
  // OptimizeBattery.stopOptimizingBatteryUsage();
  // const MethodChannel sharingChannelName = MethodChannel('sharingBand');
  // sharingChannelName.invokeMethod('startSharing');
  //////////////

  // final versionChecker = VersionChecker('1.4.0');
  // final requiresUpdate = await versionChecker.isUpdateRequired();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: AppLocales.supportedLocales,
        path: 'assets/translations',
        startLocale: AppLocales.english,
        fallbackLocale: AppLocales.english,
        child: NewsProApp(savedThemeMode: savedThemeMode),
        // Commented out the requiresUpdate logic
        // requiresUpdate
        //     ? UpdateRequiredApp()
        //     : NewsProApp(savedThemeMode: savedThemeMode),
      ),
    ),
  );
}

class NewsProApp extends StatelessWidget {
  const NewsProApp({Key? key, this.savedThemeMode}) : super(key: key);
  final AdaptiveThemeMode? savedThemeMode;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.lightTheme,
      dark: AppTheme.darkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => GlobalLoaderOverlay(
        child: MaterialApp(
          title: WPConfig.appName,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: theme,
          darkTheme: darkTheme,
          onGenerateRoute: RouteGenerator.onGenerate,
          initialRoute: AppRoutes.initial,
          onUnknownRoute: (_) => RouteGenerator.errorRoute(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

class UpdateRequiredApp extends StatelessWidget {
  const UpdateRequiredApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.update,
                  size: 80, color: Colors.red), // An update icon
              Text(
                'force_update_required'.tr(),
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'force_update_message'.tr(),
                style: const TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {
              //     const playStoreUrl =
              //         'https://play.google.com/store/apps/details?id=com.onoo.app';
              //     launch(playStoreUrl);
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Color.fromARGB(255, 222, 166, 24), // Background color
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(
              //           15), // Adjust the radius as needed
              //     ),
              //   ),
              //   child: Text(
              //     'update_now'.tr(),
              //     style: const TextStyle(
              //       color: Colors.white, // Text color
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// class VersionChecker {
//   final String latestAppVersion;

//   VersionChecker(this.latestAppVersion);

//   Future<bool> isUpdateRequired() async {
//     final packageInfo = await PackageInfo.fromPlatform();
//     final installedVersion = packageInfo.version;
//     return installedVersion != latestAppVersion;
//   }
// }






