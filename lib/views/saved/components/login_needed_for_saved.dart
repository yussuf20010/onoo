import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/utils/responsive.dart';

class LoginNeededForSavedList extends StatelessWidget {
  const LoginNeededForSavedList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding * 2),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Responsive(
              mobile: Padding(
                padding: const EdgeInsets.all(AppDefaults.padding),
                child: Image.asset(AppImages.savedPostEmpty),
              ),
              tablet: SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: Padding(
                  padding: const EdgeInsets.all(AppDefaults.padding),
                  child: Image.asset(AppImages.savedPostEmpty),
                ),
              ),
            ),
            AppSizedBox.h16,
            Text(
              'login_is_needed'.tr(),
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'login_is_needed_message'.tr(),
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),
            AppSizedBox.h16,
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: OutlinedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.loginIntro),
                child: Text(
                  'login'.tr(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
