// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';

import '../../../config/wp_config.dart';
import '../../models/config.dart';

abstract class ConfigRepositoryAbstract {
  Future<NewsProConfig?> getNewsProConfig();
}

class ConfigRepository extends ConfigRepositoryAbstract {
  final Dio dio;
  ConfigRepository({
    required this.dio,
  });

  final String baseUrl =
      'https://${WPConfig.url}/wp-json/wp/v2/newspro-configs/${WPConfig.configID}';

  @override
  Future<NewsProConfig?> getNewsProConfig() async {
    NewsProConfig? data;
    final response = await dio.get(baseUrl);
    if (response.statusCode == 200) {
      final responseData = response.data as Map<String, dynamic>;
      final data = NewsProConfig.fromMap(responseData);
      // debugPrint(data.toString());
      return data;
    } else {
      return data;
    }
  }
}
