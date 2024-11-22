import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/themes/theme_manager.dart';

class HorizontalAppLogo extends ConsumerWidget {
  const HorizontalAppLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkMode(context));
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Image.asset(
        isDark ? AppImages.horizontalLogoDark : AppImages.horizontalLogo,
        fit: BoxFit.contain,
      ),
    );
  }
}
