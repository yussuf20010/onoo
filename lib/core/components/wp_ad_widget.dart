import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/ad_config.dart';
import '../controllers/wp_ad/wp_ad_controller.dart';
import '../models/wp_ad.dart';
import '../utils/app_utils.dart';
import '../utils/responsive.dart';
import 'animated_page_switcher.dart';
import 'banner_ad.dart';
import 'network_image.dart';

class WPADWidget extends ConsumerWidget {
  const WPADWidget({
    Key? key,
    this.isBannerOnly = false,
  }) : super(key: key);

  final bool isBannerOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (AdConfig.isCustomAdOn) {
      final adProvider = ref.watch(wpAdProvider);

      return AnimatedWidgetSwitcher(
        child: adProvider.map(
            data: (data) {
              if (data.value.isNotEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Opacity(
                      opacity: 0.7,
                      child: Text('advertisement_key'.tr(),
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                    _HandleCustomAdData(
                      data: data.value,
                      isBannerOnly: isBannerOnly,
                    ),
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
            error: (v) => Text('ad_load_failed_message'.tr()),
            loading: (data) => const CircularProgressIndicator()),
      );
    } else {
      return const SizedBox();
    }
  }
}

class _HandleCustomAdData extends ConsumerWidget {
  const _HandleCustomAdData({
    Key? key,
    required this.data,
    required this.isBannerOnly,
  }) : super(key: key);

  final List<WPAd> data;
  final bool isBannerOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adController = ref.read(wpAdProvider.notifier);
    final int randomAdIndex = adController.getRandomAdNumber();
    if (isBannerOnly) {
      final theBannerAd = adController.getABannerAd();
      if (theBannerAd != null) {
        bool isTablet = Responsive.isTablet(context) ||
            Responsive.isTabletPortrait(context);
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isTablet)
              Expanded(
                child: _TheBannerAd(ad: theBannerAd),
              ),
            Expanded(
              child: _TheBannerAd(ad: theBannerAd),
            ),
          ],
        );
      } else {
        return const BannerAdWidget();
      }
    } else {
      if (data.isNotEmpty) {
        final ad = data[randomAdIndex];

        if (ad.isBanner) {
          return _TheBannerAd(ad: ad);
        } else {
          return _TheLargeBannerAD(ad: ad);
        }
      } else {
        return const SizedBox();
      }
    }
  }
}

class _TheBannerAd extends StatelessWidget {
  const _TheBannerAd({
    Key? key,
    required this.ad,
  }) : super(key: key);

  final WPAd ad;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: NetworkImageWithLoader(
              ad.imageURL,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => AppUtil.openLink(ad.adTarget),
            ),
          ),
        ),
      ],
    );
  }
}

class _TheLargeBannerAD extends StatelessWidget {
  const _TheLargeBannerAD({
    Key? key,
    required this.ad,
  }) : super(key: key);

  final WPAd ad;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: Responsive.isMobile(context) ? 250 : 120,
              child: NetworkImageWithLoader(
                ad.imageURL,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => AppUtil.openLink(ad.adTarget),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
