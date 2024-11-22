import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_pro/core/controllers/dio/dio_provider.dart';

import '../../models/post_tag.dart';
import '../../repositories/tags/tags_repository.dart';

final tagsProvider = FutureProvider.family
    .autoDispose<List<PostTag>, List<int>>((ref, tagIDList) async {
  final dio = ref.read(dioProvider);
  final repo = TagRepository(dio);
  final tags = await repo.getTagsNameById(tagIDList);
  return tags;
});
