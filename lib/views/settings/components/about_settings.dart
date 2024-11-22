import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/constants/constants.dart';
import '../../../core/controllers/config/config_controllers.dart';
import '../../../core/utils/app_utils.dart';
import '../../../core/utils/ui_util.dart';
import '../dialogs/license_dialog.dart';
import 'setting_list_tile.dart';

class AboutSettings extends ConsumerWidget {
  const AboutSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(configProvider).value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppDefaults.margin),
          child: Text(
            'about'.tr(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        SettingTile(
          label: 'terms_conditions',
          icon: IconlyLight.paper,
          iconColor: Colors.pink,
          trailing: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(IconlyLight.arrowRight2),
          ),
          onTap: () {
            final theURL = config?.termsAndServicesUrl ?? 'https://medithen.com/tos/';
            if (theURL.isNotEmpty) {
              AppUtil.openLink(theURL);
            } else {
              Fluttertoast.showToast(
                  msg: 'No Terms And Conditions page provided');
            }
          },
        ),
        SettingTile(
          label: 'about',
          icon: IconlyLight.paper,
          iconColor: Colors.blueGrey,
          trailing: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(IconlyLight.arrowRight2),
          ),
          onTap: () {
            final theURL = config?.aboutPageUrl ?? 'https://medithen.com/aboutus/';
            if (theURL.isNotEmpty) {
              AppUtil.openLink(theURL);
            } else {
              Fluttertoast.showToast(msg: 'No About page provided');
            }
          },
        ),
        SettingTile(
          label: 'privacy_policy',
          icon: IconlyLight.lock,
          iconColor: Colors.green,
          trailing: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(IconlyLight.arrowRight2),
          ),
          onTap: () {
            final privacyPolicy = config?.privacyPolicyUrl ?? 'https://medithen.com/privacy-policy/';
            if (privacyPolicy.isNotEmpty) {
              AppUtil.openLink(privacyPolicy);
            } else {
              Fluttertoast.showToast(msg: 'No privacy policy provided');
            }
          },
        ),
        SettingTile(
          label: 'rate_this_app',
          icon: IconlyLight.star,
          iconColor: Colors.blueAccent,
          trailing: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(IconlyLight.arrowRight2),
          ),
          onTap: () {
            final appstoreID = config?.appstoreAppID ?? '';
            try {
              InAppReview.instance.openStoreListing(appStoreId: appstoreID);
            } on Exception {
              Fluttertoast.showToast(msg: 'Failed to open store');
            }
          },
        ),
        SettingTile(
          label: 'license',
          icon: IconlyLight.wallet,
          iconColor: Colors.purple,
          trailing: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(IconlyLight.arrowRight2),
          ),
          onTap: () {
            UiUtil.openDialog(context: context, widget: const LicenseDialog());
          },
        ),
        SettingTile(
          label: 'share_this_app',
          icon: FontAwesomeIcons.share,
          iconColor: Colors.purple,
          trailing: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(IconlyLight.arrowRight2),
          ),
          onTap: () async {
            await Share.share(
                'MediThen Ai , Check First Ai Medical App : ${config?.appShareLink}');
          },
        ),
      ],
    );
  }
}
