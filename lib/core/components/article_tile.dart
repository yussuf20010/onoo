import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../core/constants/constants.dart';
import '../models/article.dart';
import '../routes/app_routes.dart';
import '../utils/app_utils.dart';
import 'article_category_row.dart';
import 'network_image.dart';
import 'video_article_wrapper.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    Key? key,
    required this.article,
    this.isMainPage = false,
  }) : super(key: key);

  final ArticleModel article;
  final bool isMainPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDefaults.margin / 2),
      child: Material(
        color: isMainPage
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).canvasColor,
        borderRadius: AppDefaults.borderRadius,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.post,
              arguments: article,
            );
          },
          borderRadius: AppDefaults.borderRadius,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: AppDefaults.boxShadow,
            ),
            child: Row(
              children: [
                // thumbnail
                Expanded(
                  flex: 3,
                  child: VideoArticleWrapper(
                    isVideoArticle: ArticleModel.isVideoArticle(article),
                    child: Hero(
                      tag: article.heroTag,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(AppDefaults.radius),
                          bottomLeft: Radius.circular(AppDefaults.radius),
                        ),
                        child: AspectRatio(
                          aspectRatio: 2 / 2,
                          child: NetworkImageWithLoader(article.thumbnail),
                        ),
                      ),
                    ),
                  ),
                ),
                // Description
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppUtil.trimHtml(article.title),
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),

                        /* <---- Category List -----> */
                        ArticleCategoryRow(article: article),
                        Row(
                          children: [
                            const Icon(
                              IconlyLight.timeCircle,
                              color: AppColors.placeholder,
                              size: 18,
                            ),
                            AppSizedBox.w5,
                            Text(
                              '${AppUtil.totalMinute(article.content, context)} ${'minute_read'.tr()}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        AppSizedBox.h5,
                        Row(
                          children: [
                            const Icon(
                              IconlyLight.calendar,
                              color: AppColors.placeholder,
                              size: 18,
                            ),
                            AppSizedBox.w5,
                            Text(
                              AppUtil.getTime(article.date, context),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
