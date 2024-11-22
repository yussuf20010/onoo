import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/components/animated_page_switcher.dart';

import '../../../../core/components/app_shimmer.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/controllers/posts/popular_posts_controller.dart';
import '../../../../core/controllers/users/author_data_provider.dart';
import '../../../../core/models/article.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_utils.dart';

class PostMetaData extends StatelessWidget {
  const PostMetaData({
    Key? key,
    required this.article,
  }) : super(key: key);

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                IconlyBold.timeCircle,
                color: Colors.grey,
              ),
              AppSizedBox.w5,
              Text(
                '${AppUtil.totalMinute(article.content, context)} ${'minute_read'.tr()} | Posted ${AppUtil.getTime(article.date, context)}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ],
          ),
          AppSizedBox.h5,
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: AuthorData(articleModel: article),
              ),
              const Spacer(),
              // CommentCounter(data: article),
              TrendingIndicator(article: article),
            ],
          ),
        ],
      ),
    );
  }
}

class TrendingIndicator extends ConsumerWidget {
  const TrendingIndicator({
    Key? key,
    required this.article,
  }) : super(key: key);

  final ArticleModel article;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTrending = ref.watch(isTrendingProvider(article));
    if (isTrending) {
      return Row(
        children: [
          const Icon(
            Icons.bolt_rounded,
            color: AppColors.primary,
            // size: 16,
          ),
          AppSizedBox.h5,
          Text(
            'Trending',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}

class CommentCounter extends StatelessWidget {
  const CommentCounter({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ArticleModel data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.comment,
          size: 16,
          color: Colors.grey,
        ),
        AppSizedBox.w5,
        Text(
          '${data.totalComments} ${'load_comments'.tr()}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class AuthorData extends ConsumerWidget {
  const AuthorData({
    Key? key,
    required this.articleModel,
  }) : super(key: key);

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedWidgetSwitcher(
      child: ref.watch(authorDataProvider(articleModel.authorID)).map(
            data: (data) => InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.authorPage,
                  arguments: data.value!,
                );
              },
              child: Row(
                children: [
                  data.value?.avatarUrl == null
                      ? const Icon(
                          IconlyBold.profile,
                          color: Colors.grey,
                          size: 18,
                        )
                      : CircleAvatar(
                          backgroundImage:
                              CachedNetworkImageProvider(data.value!.avatarUrl),
                          radius: 9.5,
                        ),
                  AppSizedBox.w5,
                  Text(
                    data.value?.name ?? 'Author',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            loading: (d) => const LoadingAuthorData(),
            error: (e) => const Text('Error'),
          ),
    );
  }
}

class LoadingAuthorData extends StatelessWidget {
  const LoadingAuthorData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Row(
        children: [
          const Icon(
            IconlyBold.profile,
            color: Colors.grey,
            size: 18,
          ),
          AppSizedBox.w5,
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: AppDefaults.borderRadius),
            child: Text(
              'Author',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
