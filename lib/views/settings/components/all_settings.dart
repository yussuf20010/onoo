import 'package:android_intent_plus/android_intent.dart';
import 'package:app_settings/app_settings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:news_pro/core/components/app_native_ad.dart';

import '../../../core/components/select_theme_mode.dart';
import '../../../config/ad_config.dart';
import '../../../core/constants/constants.dart';
import '../../../core/controllers/notifications/notification_remote.dart';
import '../../../core/controllers/notifications/notification_toggle.dart';
import '../../../core/utils/ui_util.dart';
import '../dialogs/change_language.dart';
import 'about_settings.dart';
import 'buy_this_app.dart';
import 'setting_list_tile.dart';
import 'social_settings.dart';
import 'user_settings.dart';

class AllSettings extends StatelessWidget {
  const AllSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Theme.of(context).cardColor,
      child: AnimationLimiter(
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
            childAnimationBuilder: (child) => SlideAnimation(
              duration: AppDefaults.duration,
              verticalOffset: 50.00,
              child: child,
            ),
            children: [
              const UserSettings(),
              const GeneralSettings(),
              const AboutSettings(),
              const SocialSettings(),
              // const BuyAppSettings(),
            ],
          ),
        ),
      ),
    );
  }
}

class GeneralSettings extends StatelessWidget {
  const GeneralSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppDefaults.margin),
          child: Text(
            'general_settings'.tr(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const NotificationTileRow(),
        // const BandNotificationTileRow(),
        // BandSdkTileRow(),


        SettingTile(
          label: 'band_sdk_notification'.tr(),
          icon: Icons.notifications_off,
          iconColor: Colors.redAccent,
          trailing: const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          onTap: () async {
            // Replace the comment with a call to openChannelSettings
            // openAppNotificationSettings();
            openChannelSettings('CHANNEL_ID_13371351');
          },
        ),



        SettingTile(
          label: 'language',
          icon: Icons.language_rounded,
          iconColor: Colors.purple,
          trailing: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(IconlyLight.arrowRight2),
          ),
          onTap: () async {
            await UiUtil.openBottomSheet(
              context: context,
              widget: const ChangeLanguageDialog(),
            );
          },
        ),
        SelectThemeMode(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      ],
    );
  }
}

class NotificationTileRow extends ConsumerWidget {
  const NotificationTileRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NotificationState notificationState = ref.watch(notificationStateProvider);
    final notificationController =
        ref.read(remoteNotificationProvider(context).notifier);

    return SettingTile(
      label: 'notification',
      icon: IconlyLight.notification,
      iconColor: Colors.green,
      trailing: CupertinoSwitch(
        value: notificationState == NotificationState.on,
        onChanged: (v) async {
          bool isLoading = notificationState == NotificationState.loading;
          if (isLoading) {
            debugPrint('Loading now...');
          } else {
            await notificationController.toggleNotification();
          }
        },
        activeColor: AppColors.primary,
      ),
    );
  }
}


// void openAppNotificationSettings() {
//   const AndroidIntent intent = AndroidIntent(
//     action: 'android.settings.APP_NOTIFICATION_SETTINGS',
//     arguments: <String, dynamic>{
//       'android.provider.extra.APP_PACKAGE': 'com.onoo.app',
//     },
//   );
//   intent.launch();
// }

void openChannelSettings(String channelId) {
  final AndroidIntent intent = AndroidIntent(
    action: 'android.settings.CHANNEL_NOTIFICATION_SETTINGS',
    arguments: <String, dynamic>{
      'android.provider.extra.APP_PACKAGE': 'com.onoo.app',
      'android.provider.extra.CHANNEL_ID': channelId,
    },
  );
  intent.launch();
}


// Future<void> openNotificationChannelSettings() async {
//   // Replace 'your_package_name' with your actual package name
//   const String packageName = 'com.onoo.app';
//
//   // Replace 'your_channel_id' with your actual notification channel ID
//   const String channelId = 'SDK_Notification_Channel';
//
//   const String intentUri = 'package:$packageName/com.android.settings.Settings/notification/$channelId';
//
//   if (await canLaunch(intentUri)) {
//     await launch(intentUri);
//   } else {
//     print('Could not launch $intentUri');
//   }
// }

