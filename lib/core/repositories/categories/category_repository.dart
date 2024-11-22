import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../config/wp_config.dart';
import '../../controllers/dio/dio_provider.dart';
import '../../models/category.dart';

final categoriesRepoProvider = Provider<CategoriesRepository>((ref) {
  final dio = ref.read(dioProvider);
  return CategoriesRepository(dio: dio);
});

abstract class CategoriesRepoAbstract {
  /// Gets all the category from the website
  Future<List<CategoryModel>> getAllCategory();

  /// Get Single Category
  Future<CategoryModel?> getCategory(int id);

  /// Get These Categories
  Future<List<CategoryModel>> getTheseCategories(List<int> ids);

  /// Get All Parent Categories
  Future<List<CategoryModel>> getAllParentCategories(int page);

  /// Get All Sub Categories
  Future<List<CategoryModel>> getAllSubcategories(
      {required int page, required int parentId});
}

class CategoriesRepository extends CategoriesRepoAbstract {
  final Dio dio;
  CategoriesRepository({
    required this.dio,
  });

  @override
  Future<List<CategoryModel>> getAllCategory() async {
    final blockedCategories = _getBlockedCategories();

    String url =
        'https://${WPConfig.url}/wp-json/wp/v2/categories?per_page=100&?exclude=$blockedCategories';
    List<CategoryModel> allCategories = [];
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {}
      final allData = response.data as List;
      allCategories = allData.map((e) => CategoryModel.fromMap(e)).toList();
      // debugPrint(allCategories.toString());
      return allCategories;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  @override
  Future<CategoryModel?> getCategory(int id) async {
    String url = 'https://${WPConfig.url}/wp-json/wp/v2/categories/$id';
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return CategoryModel.fromMap(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  /// Get Blocked Categories defined in [WPConfig]
  String _getBlockedCategories() {
    String data = '';
    final blockedData = WPConfig.blockedCategoriesIds;
    if (blockedData.length > 1) {
      data = blockedData.join(',');
    } else {
      data = blockedData.first.toString();
    }
    return data;
  }

  @override
  Future<List<CategoryModel>> getTheseCategories(List<int> ids) async {
    List<CategoryModel> allCategories = [];
    if (ids.isEmpty) {
      return allCategories;
    } else if (ids.length <= 10) {
      final categories = ids.join(',');
      final url =
          'https://${WPConfig.url}/wp-json/wp/v2/categories?per_page=100&?include=$categories&orderby=include';

      try {
        final response = await dio.get(url);
        if (response.statusCode == 200) {
          final allData = response.data as List;
          allCategories = allData.map((e) => CategoryModel.fromMap(e)).toList();
          return allCategories;
        } else {
          debugPrint(response.data);
          return allCategories;
        }
      } catch (e) {
        debugPrint(e.toString());
        return allCategories;
      }
    } else {
      for (var i = 0; i < ids.length; i++) {
        final url =
            'https://${WPConfig.url}/wp-json/wp/v2/categories/?per_page=100&${ids[i]}';
        try {
          final response = await dio.get(url);
          if (response.statusCode == 200) {
            allCategories.add(CategoryModel.fromMap(response.data));
          } else {}
        } catch (e) {
          debugPrint(e.toString());
        }
      }
      return allCategories;
    }
  }

  @override
  Future<List<CategoryModel>> getAllParentCategories(int page) async {
    final blockedCategories = _getBlockedCategories();

    String url =
        'https://${WPConfig.url}/wp-json/wp/v2/categories/?per_page=100&?parent=0&page=$page&exclude=$blockedCategories';
    List<CategoryModel> allCategories = [];
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {}
      final allData = response.data as List;
      allCategories = allData.map((e) => CategoryModel.fromMap(e)).toList();
      // debugPrint(allCategories.toString());
      return allCategories;
    } catch (e) {
      Fluttertoast.showToast(msg: 'There is an error while getting categories');
      debugPrint(e.toString());
      return [];
    }
  }

  @override
  Future<List<CategoryModel>> getAllSubcategories({
    required int page,
    required int parentId,
  }) async {
    final blockedCategories = _getBlockedCategories();

    String url =
        'https://${WPConfig.url}/wp-json/wp/v2/categories/?parent=$parentId&page=$page&exclude=$blockedCategories';
    List<CategoryModel> allCategories = [];
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {}
      final allData = response.data as List;
      allCategories = allData.map((e) => CategoryModel.fromMap(e)).toList();
      // debugPrint(allCategories.toString());
      return allCategories;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
