import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../config/wp_config.dart';
import '../../../core/constants/constants.dart';
import '../../../core/controllers/config/config_controllers.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/utils/app_utils.dart';
import 'setting_list_tile.dart';

class SocialSettings extends ConsumerWidget {
  const SocialSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(configProvider).value;
    final facebookUrl = config?.facebookUrl ?? 'https://www.facebook.com/medithen';
    final telegramUrl = config?.telegramUrl ?? 'https://www.t.me/medithen';
    final youtubeUrl = config?.youtubeUrl ?? 'https://www.youtube.com/channel/UCbbwH0jAz9AOutG63GFeKmw';
    final twitterUrl = config?.twitterUrl ?? '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppDefaults.margin),
          child: Text(
            'social'.tr(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        SettingTile(
          label: 'contact_us',
          icon: Icons.contact_mail_rounded,
          iconColor: Colors.blueGrey,
          trailing: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(IconlyLight.arrowRight2),
          ),
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.contact);
          },
        ),
        SettingTile(
          label: 'website',
          icon: FontAwesomeIcons.earthAsia,
          isFaIcon: true,
          iconColor: Colors.green,
          trailing: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(IconlyLight.arrowRight2),
          ),
          onTap: () {
            const url = WPConfig.url;
            if (url.isNotEmpty) {
              AppUtil.openLink('https://$url');
            } else {
              Fluttertoast.showToast(msg: 'No App Url link provided');
            }
          },
        ),
        if (facebookUrl.isNotEmpty)
          SettingTile(
            label: 'Facebook',
            icon: FontAwesomeIcons.facebook,
            shouldTranslate: false,
            isFaIcon: true,
            iconColor: Colors.blue,
            trailing: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(IconlyLight.arrowRight2),
            ),
            onTap: () {
              final url = facebookUrl;
              if (url.isNotEmpty) {
                AppUtil.openLink(url);
              } else {
                Fluttertoast.showToast(msg: 'No Facebook link provided');
              }
            },
          ),
        if (youtubeUrl.isNotEmpty)
          SettingTile(
            label: 'Youtube',
            shouldTranslate: false,
            icon: FontAwesomeIcons.youtube,
            isFaIcon: true,
            iconColor: Colors.red,
            trailing: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(IconlyLight.arrowRight2),
            ),
            onTap: () {
              final url = youtubeUrl;
              if (url.isNotEmpty) {
                AppUtil.openLink(url);
              } else {
                Fluttertoast.showToast(msg: 'No Youtube link provided');
              }
            },
          ),
        if (twitterUrl.isNotEmpty)
          SettingTile(
            label: 'Twitter',
            shouldTranslate: false,
            icon: FontAwesomeIcons.twitter,
            isFaIcon: true,
            iconColor: Colors.lightBlue,
            trailing: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(IconlyLight.arrowRight2),
            ),
            onTap: () {
              final url = twitterUrl;
              if (url.isNotEmpty) {
                AppUtil.openLink(url);
              } else {
                Fluttertoast.showToast(msg: 'No Twitter link provided');
              }
            },
          ),
        if (telegramUrl.isNotEmpty)
          SettingTile(
            label: 'Telegram',
            shouldTranslate: false,
            icon: FontAwesomeIcons.telegram,
            isFaIcon: true,
            iconColor: Colors.lightBlue,
            trailing: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(IconlyLight.arrowRight2),
            ),
            onTap: () {
              final url = telegramUrl;
              if (url.isNotEmpty) {
                AppUtil.openLink(url);
              } else {
                Fluttertoast.showToast(msg: 'No Telegram link provided');
              }
            },
          ),
      ],
    );
  }
}
