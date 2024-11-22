import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_pro/core/controllers/dio/dio_provider.dart';

import '../../../config/app_images_config.dart';
import '../../models/category.dart';
import '../../models/config.dart';
import '../../repositories/categories/category_repository.dart';
import '../../repositories/configs/config_repository.dart';

final configProvider =
    StateNotifierProvider<NewsProConfigNotifier, AsyncValue<NewsProConfig>>(
        (ref) {
  final dio = ref.read(dioProvider);
  final repo = ConfigRepository(dio: dio);
  final categoriesRepo = ref.read(categoriesRepoProvider);
  return NewsProConfigNotifier(repo, categoriesRepo);
});

class NewsProConfigNotifier extends StateNotifier<AsyncValue<NewsProConfig>> {
  NewsProConfigNotifier(
    this.repo,
    this.categoriesRepository,
  ) : super(const AsyncLoading()) {
    {
      init();
    }
  }

  final ConfigRepository repo;
  final CategoriesRepository categoriesRepository;

  init() async {
    final data = await repo.getNewsProConfig();
    if (data == null) {
      const errorMessage = 'No configuration found';
      state = AsyncError(errorMessage, StackTrace.fromString(errorMessage));
    } else {
      state = AsyncData(data);
    }
  }

  Future<List<CategoryModel>> getFeaturedCategories() async {
    final list = await categoriesRepository
        .getTheseCategories(state.value?.featuredCategories ?? []);

    final CategoryModel featureCategory = CategoryModel(
      id: 0, // ignored
      name: state.value?.homeMainTabName ?? 'Trending',
      slug: '', // ignored
      link: '', // ignored
      parent: 0, // ignored,
      thumbnail: AppImagesConfig.defaultCategoryImage,
    );

    list.insert(0, featureCategory);

    return list;
  }
}
