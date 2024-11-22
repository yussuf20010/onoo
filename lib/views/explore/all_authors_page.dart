import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../core/controllers/users/authors_pagination.dart';

import 'components/author_list_tile.dart';

import '../../core/constants/constants.dart';

class AllAuthorsPage extends StatelessWidget {
  const AllAuthorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authors'),
      ),
      body: const _AuthorListRenderer(),
    );
  }
}

class _AuthorListRenderer extends ConsumerWidget {
  const _AuthorListRenderer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersController);
    final controllers = ref.watch(usersController.notifier);

    if (users.initialLoaded == false) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    } else if (users.refershError) {
      return Center(child: Text(users.errorMessage));
    } else if (users.items.isEmpty) {
      return const Center(child: Text('No Users Found'));
    } else {
      return Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: controllers.onRefresh,
              child: ListView.builder(
                itemCount: users.items.length,
                itemBuilder: (context, index) {
                  controllers.handleScrollWithIndex(index);
                  return AuthorListTile(
                    author: users.items[index],
                  );
                },
              ),
            ),
          ),
          if (users.isPaginationLoading)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: LoadingAnimationWidget.threeArchedCircle(
                  color: AppColors.primary, size: 36),
            ),
        ],
      );
    }
  }
}
