import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:news_pro/views/explore/components/search_bar.dart';

import '../../../config/wp_config.dart';
import '../../../core/constants/app_defaults.dart';
import '../../../core/models/category.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/utils/responsive.dart';
import '../category_page.dart';
import 'Questions/Questions_ExploreMainClass.dart';
import 'category_tile.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    Key? key,
    required this.categories,
    required this.handleScrollWithIndex,
    required this.isPaginationLoading,
    required this.onRefresh,
  }) : super(key: key);

  final List<CategoryModel> categories;
  final void Function(int index) handleScrollWithIndex;
  final bool isPaginationLoading;
  final Future<void> Function() onRefresh;

  List<CategoryModel> filterCategory(List<CategoryModel> categories, String cNumber) {
    List<CategoryModel> filteredList = categories.where((element) => element.slug.startsWith(cNumber)).toList();
    return filteredList;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const SearchButton(),
          bottom: TabBar(
            tabs: [
              Text('en_article'.tr(), style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold)),
              Text('ar_article'.tr(), style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold)),
              Text('videos'.tr(), style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold)),
              Text('questions'.tr(), style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Expanded(
                  child: Responsive(
                    mobile: _MobileListView(
                      categories: filterCategory(categories, WPConfig.enArticleCategoryFilterNumber),
                      handleScrollWithIndex: handleScrollWithIndex,
                      onRefresh: onRefresh,
                    ),
                    tablet: _TabletView(
                      categories: filterCategory(categories, WPConfig.enArticleCategoryFilterNumber),
                      handleScrollWithIndex: handleScrollWithIndex,
                      onRefresh: onRefresh,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: Responsive(
                    mobile: _MobileListView(
                      categories: filterCategory(categories, WPConfig.arArticleCategoryFilterNumber),
                      handleScrollWithIndex: handleScrollWithIndex,
                      onRefresh: onRefresh,
                    ),
                    tablet: _TabletView(
                      categories: filterCategory(categories, WPConfig.arArticleCategoryFilterNumber),
                      handleScrollWithIndex: handleScrollWithIndex,
                      onRefresh: onRefresh,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: Responsive(
                    mobile: _MobileListView(
                      categories: filterCategory(categories, WPConfig.videosCategoryFilterNumber),
                      handleScrollWithIndex: handleScrollWithIndex,
                      onRefresh: onRefresh,
                    ),
                    tablet: _TabletView(
                      categories: filterCategory(categories, WPConfig.videosCategoryFilterNumber),
                      handleScrollWithIndex: handleScrollWithIndex,
                      onRefresh: onRefresh,
                    ),
                  ),
                ),
              ],
            ),


            const Column(
              children: [
                Expanded(
                  child: QuestionsExploreMainClass(),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}

class _MobileListView extends StatelessWidget {
  const _MobileListView({
    Key? key,
    required this.categories,
    required this.handleScrollWithIndex,
    required this.onRefresh,
  }) : super(key: key);

  final List<CategoryModel> categories;
  final void Function(int index) handleScrollWithIndex;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          handleScrollWithIndex(index);
          final data = categories[index];
          final background = data.thumbnail;

          return AnimationConfiguration.staggeredList(
            position: index,
            child: SlideAnimation(
              child: CategoryTile(
                categoryModel: data,
                backgroundImage: background,
                onTap: () {
                  final arguments = CategoryPageArguments(
                    category: data,
                    backgroundImage: background,
                  );
                  Navigator.pushNamed(
                    context,
                    AppRoutes.category,
                    arguments: arguments,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TabletView extends StatelessWidget {
  const _TabletView({
    Key? key,
    required this.categories,
    required this.handleScrollWithIndex,
    required this.onRefresh,
  }) : super(key: key);

  final List<CategoryModel> categories;
  final void Function(int index) handleScrollWithIndex;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3,
          mainAxisSpacing: AppDefaults.margin,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          handleScrollWithIndex(index);
          final data = categories[index];
          final background = data.thumbnail;
          return AnimationConfiguration.staggeredList(
            position: index,
            child: SlideAnimation(
              child: CategoryTile(
                categoryModel: data,
                backgroundImage: background,
                onTap: () {
                  final arguments = CategoryPageArguments(
                    category: data,
                    backgroundImage: background,
                  );
                  Navigator.pushNamed(
                    context,
                    AppRoutes.category,
                    arguments: arguments,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}