import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_pro/core/controllers/dio/dio_provider.dart';

import '../../../config/ad_config.dart';
import '../../models/wp_ad.dart';
import '../../repositories/wp_ad/wp_ad_repository.dart';

final wpAdProvider =
    StateNotifierProvider<WPAdNotifier, AsyncData<List<WPAd>>>((ref) {
  final dio = ref.read(dioProvider);
  final repo = WPAdRepository(dio);
  return WPAdNotifier(repo);
});

class WPAdNotifier extends StateNotifier<AsyncData<List<WPAd>>> {
  WPAdNotifier(this.repo) : super(const AsyncData([])) {
    {
      onInit();
    }
  }

  final WPAdRepository repo;

  onInit() async {
    if (AdConfig.isCustomAdOn) {
      state = AsyncData(await repo.getAllAds());
    } else {
      state = const AsyncData([]);
    }
  }

  int getRandomAdNumber() {
    final totalAds = state.value.length;

    if (totalAds > 0) {
      final random = math.Random();
      final adNumber = random.nextInt(totalAds);
      return adNumber;
    } else {
      // this is ignored
      return -1;
    }
  }

  WPAd? getABannerAd() {
    final allBannerAds =
        state.value.where((element) => element.isBanner).toList();
    if (allBannerAds.isNotEmpty) {
      final totalAds = allBannerAds.length;
      final random = math.Random();
      final adNumber = random.nextInt(totalAds);
      return allBannerAds[adNumber];
    } else {
      return null;
    }
  }

  WPAd? getALargeBannerAd() {
    final allBannerAds =
        state.value.where((element) => !element.isBanner).toList();
    if (allBannerAds.isNotEmpty) {
      final totalAds = allBannerAds.length;
      final random = math.Random();
      final adNumber = random.nextInt(totalAds);
      return allBannerAds[adNumber];
    } else {
      return null;
    }
  }
}
