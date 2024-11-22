import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../config/ad_config.dart';
import '../../../../core/components/banner_ad.dart';
import '../../../../core/components/headline_with_row.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/controllers/posts/popular_posts_controller.dart';
import '../../../../core/controllers/posts/recent_posts_controller.dart';
import '../../../../core/models/article.dart';
import '../../../../core/utils/responsive.dart';
import 'post_slider.dart';
import 'post_slider_tablet.dart';
import 'recent_post_list.dart';

class TrendingTabSection extends ConsumerWidget {
  const TrendingTabSection({
    Key? key,
    required this.posts,
  }) : super(key: key);

  final List<ArticleModel> posts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Theme.of(context).cardColor,
      child: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(popularPostsController);
          await ref.read(recentPostController.notifier).onRefresh();
          Fluttertoast.showToast(msg: 'Refreshed');
        },
        child: CustomScrollView(
          slivers: [
            /* <---- Featured News -----> */

            SliverPadding(
              padding: const EdgeInsets.only(top: AppDefaults.padding),
              sliver: SliverToBoxAdapter(
                child: Responsive(
                  mobile: PostSlider(articles: posts),
                  tablet: PostSliderTablet(articles: posts),
                ),
              ),
            ),

            if (AdConfig.isAdOn)
              const SliverToBoxAdapter(
                child: BannerAdWidget(),
              ),

            /* <---- Recent News -----> */

            // AppSizedBox.h16,
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDefaults.padding),
                child: HeadlineRow(
                  headline: 'recent_news',
                  isHeader: false,
                ),
              ),
            ),
            const RecentPostFetcherSection(),
          ],
        ),
      ),
    );
  }
}
