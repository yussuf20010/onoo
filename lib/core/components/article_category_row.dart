import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'animated_page_switcher.dart';

import '../constants/constants.dart';
import '../controllers/category/categories_controller.dart';
import '../controllers/category/categories_provider.dart';
import '../models/article.dart';
import '../utils/app_utils.dart';
import 'app_shimmer.dart';

class ArticleCategoryRow extends ConsumerWidget {
  const ArticleCategoryRow({
    Key? key,
    required this.article,
    this.isPostDetailPage = false,
    this.isSavedPage = false,
  }) : super(key: key);

  final ArticleModel article;
  final bool isPostDetailPage;
  final bool isSavedPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allCategories = ref.watch(categoriesProvider(article.categories));

    return AnimatedWidgetSwitcher(
      child: allCategories.map(
          data: (data) {
            final theCategories = allCategories.value ?? [];
            if (isPostDetailPage) {
              return Wrap(
                spacing: 8,
                children: List.generate(
                  theCategories.length,
                  (index) => InkWell(
                    onTap: () {
                      final categories =
                          ref.read(categoriesController.notifier);
                      categories.goToCategoriesPage(
                          context, theCategories[index].id);
                    },
                    child: Chip(
                      backgroundColor: isPostDetailPage
                          ? Theme.of(context).cardColor
                          : Theme.of(context).scaffoldBackgroundColor,
                      label: AutoSizeText(
                        AppUtil.trimHtml(theCategories[index].name),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      side: const BorderSide(
                        width: 0.2,
                        color: AppColors.cardColor,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    theCategories.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4.0,
                      ),
                      child: Chip(
                        backgroundColor: isSavedPage
                            ? Theme.of(context).cardColor
                            : Theme.of(context).scaffoldBackgroundColor,
                        label: AutoSizeText(
                          AppUtil.trimHtml(theCategories[index].name),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        side: const BorderSide(
                          width: 0.2,
                          color: AppColors.cardColor,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          },
          loading: (loading) => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    2,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4.0,
                      ),
                      child: AppShimmer(
                        child: Chip(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          label: Text(
                            'used for loading',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          side: const BorderSide(
                            width: 0.2,
                            color: AppColors.cardColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          error: (v) => const Text('There is en error')),
    );
  }
}

class ArticleCategoryRowText extends ConsumerWidget {
  const ArticleCategoryRowText({
    Key? key,
    required this.article,
    this.isPostDetailPage = false,
  }) : super(key: key);

  final ArticleModel article;
  final bool isPostDetailPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allCategories = ref.watch(categoriesProvider(article.categories));

    return AnimatedWidgetSwitcher(
      child: allCategories.map(
          data: (data) {
            final theCategories = allCategories.value ?? [];

            return SingleChildScrollView(
              padding: const EdgeInsetsDirectional.only(
                start: AppDefaults.padding,
              ),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  theCategories.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(
                      right: 4,
                      bottom: AppDefaults.padding,
                      top: 4,
                      left: 4,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.filter_none,
                          size: 10,
                        ),
                        AppSizedBox.w5,
                        AutoSizeText(
                          AppUtil.trimHtml(theCategories[index].name),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          loading: (loading) => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    2,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4.0,
                      ),
                      child: AppShimmer(
                        child: Chip(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          label: Text(
                            'used for loading',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          side: const BorderSide(
                            width: 0.2,
                            color: AppColors.cardColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          error: (v) => const Text('There is en error')),
    );
  }
}
