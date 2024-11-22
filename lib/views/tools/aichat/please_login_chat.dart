import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:news_pro/config/wp_config.dart';
import 'package:news_pro/core/components/app_logo.dart';
import 'package:news_pro/core/constants/app_colors.dart';
import 'package:news_pro/core/constants/app_defaults.dart';
import 'package:news_pro/core/constants/sizedbox_const.dart';
import 'package:news_pro/core/routes/app_routes.dart';
import 'package:news_pro/core/utils/responsive.dart';
import 'package:news_pro/core/utils/ui_util.dart';
import 'package:news_pro/views/entrypoint/entrypoint.dart';
import 'package:news_pro/views/settings/dialogs/change_language.dart';
import 'package:news_pro/views/auth/components/dont_have_account_button.dart';

class ChatLoginIntroPage extends StatelessWidget {
  const ChatLoginIntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
          child: Column(
            children: [
              /// Header
              const LoginIntroHeader(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(AppDefaults.padding),
                child: Column(
                  children: [
                    Responsive(
                      mobile: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: const AppLogo(),
                      ),
                      tablet: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: const AppLogo(),
                      ),
                    ),
                    AppSizedBox.h16,
                    AppSizedBox.h16,
                    Text(
                      '${'welcome_newspro'.tr()} ${WPConfig.appName}',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        // fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Responsive(
                      mobile: Padding(
                        padding: const EdgeInsets.all(16),
                        child: AutoSizeText(
                          '${'please_login_chat'.tr()}',
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      tablet: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: AutoSizeText(
                            '${'please_login_chat'.tr()}',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: AppDefaults.margin),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.login);
                    },
                    child: Text('sign_in_continue'.tr()),
                  ),
                ),
              ),
              const DontHaveAccountButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginIntroHeader extends StatelessWidget {
  const LoginIntroHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Change Locale Button
        IconButton(
          onPressed: () {
            UiUtil.openBottomSheet(
                context: context, widget: const ChangeLanguageDialog());
          },
          icon: const Icon(Icons.language_rounded),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const EntryPointUI()),
                  (v) => false,
            );
          },
          child: Text('skip'.tr()),
        ),
      ],
    );
  }
}
