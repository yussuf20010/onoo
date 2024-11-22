import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../controllers/internet/internet_state_provider.dart';
import 'package:path_provider/path_provider.dart';

import '../../config/ad_config.dart';
import '../controllers/auth/auth_controller.dart';
import '../controllers/notifications/notification_local.dart';
import '../controllers/notifications/notification_remote.dart';
import '../repositories/auth/auth_repository.dart';
import '../repositories/others/notification_local.dart';
import '../repositories/others/onboarding_local.dart';
import '../repositories/others/search_local.dart';
import '../repositories/posts/post_repository.dart';

/// App Initial State
enum AppState { introNotDone, loggedIn, loggedOut }

final coreAppStateProvider =
FutureProvider.family<AppState, BuildContext>((ref, context) async {
  /// Load All Repository and Other Necassary Services Here
  ref.read(internetStateProvider);
  Directory appDocDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocDir.path);

  final onboarding = await OnboardingRepository().init();

  ref.read(authRepositoryProvider).init();
  // ref.read(postRepoProvider).init();
  ref.read(postRepoProvider);
  await SearchLocalRepo().init();
  await Firebase.initializeApp();
  ref.read(authController);

  await NotificationsRepository().init();
  ref.read(localNotificationProvider);
  if (AdConfig.isAdOn) await MobileAds.instance.initialize();

  /// Handles background notification
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  // ignore: use_build_context_synchronously
  setupInteractedMessage(context, ref);

  // Is user has been introduced to our app
  if (onboarding.isIntroDone()) {
    return AppState.loggedOut;
  } else {
    return AppState.introNotDone;
  }
});
