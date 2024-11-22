import 'package:flutter/material.dart';
import '../../components/article_tile_large.dart';

import '../../../config/ad_config.dart';
import '../../components/article_tile.dart';
import '../../components/banner_ad.dart';
import '../../components/wp_ad_widget.dart';
import '../../models/article.dart';
import '../../utils/responsive.dart';

class AdController {
  static List<Widget> getAdWithPosts(
    List<ArticleModel> posts, {
    bool isMainPage = false,
    required bool isMobile,
  }) {
    final data = posts;
    final int every = AdConfig.adIntervalInCategory;
    final int everyWP = AdConfig.adIntervalInCustomAd;

    final int size = data.length + data.length ~/ every;
    final List<Widget> items = List.generate(
      size,
      (i) {
        if (i != 0 && i % every == 0) {
          if (AdConfig.isAdOn) {
            return const BannerAdWidget();
          } else {
            return const _AdSpace();
          }
        } else if (i != 0 && i % everyWP == 0) {
          if (AdConfig.isCustomAdOn) {
            return const WPADWidget();
          } else {
            return const _AdSpace();
          }
        } else {
          if (isMobile) {
            if (i % 6 == 0 && i != 0) {
              return ArticleTileLarge(
                article: data[i - i ~/ every],
                isMainPage: isMainPage,
              );
            } else {
              return ArticleTile(
                article: data[i - i ~/ every],
                isMainPage: isMainPage,
              );
            }
          } else {
            return ArticleTile(
              article: data[i - i ~/ every],
              isMainPage: isMainPage,
            );
          }
        }
      },
    );
    return items;
  }
}

class _AdSpace extends StatelessWidget {
  const _AdSpace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: const SizedBox(),
      tablet: Center(
        child: Text(
          'Advertisement Space',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      tabletPortrait: Center(
        child: Text(
          'Advertisement Space',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
