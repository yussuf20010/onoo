import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../notes/core/controllers/note_controller.dart';
import '../../../notes/ui/pages/add_note_page.dart';
import '../../../notes/ui/styles/text_styles.dart';
import '../../../notes/ui/widgets/icon_button.dart';
import '../../../notes/ui/widgets/note_tile.dart';

class HomePage extends StatelessWidget {
  final _notesController = Get.put(NoteController());

  final _tileCounts = [
    [2, 2],
    [2, 2],
    [4, 2],
    [2, 3],
    [2, 2],
    [2, 3],
    [2, 2],
  ];
  final _tileTypes = [
    TileType.Square,
    TileType.Square,
    TileType.HorRect,
    TileType.VerRect,
    TileType.Square,
    TileType.VerRect,
    TileType.Square,
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF00C897), // Dark mode FAB color
          onPressed: () {
            Get.to(
              const AddNotePage(
                note: null,
              ),
              transition: Transition.downToUp,
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            _appBar(context),
            const SizedBox(
              height: 16,
            ),
            _body(context),
          ],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
          onTap: () {
            Navigator.of(context, rootNavigator: true).pop(context);
    },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: const Color(0xFF00C897),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Icon(
            Icons.navigate_before,
            color: Colors.white,
          ),
        ),
      ),
    ),
          Text(
            'Notes',
            style: titleTextStyle.copyWith(fontSize: 32, color: const Color(0xFF00C897)),
          ),
          MyIconButton(
            onTap: () {},
            icon: Icons.search,
          ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(() {
          if (_notesController.noteList.isNotEmpty) {
            return StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              axisDirection: AxisDirection.down,
              children: [
                for (int i = 0; i < _notesController.noteList.length; i++)
                  StaggeredGridTile.count(
                    crossAxisCellCount: _tileCounts[i % 7][0],
                    mainAxisCellCount: _tileCounts[i % 7][1],
                    child: NoteTile(
                      index: i,
                      note: _notesController.noteList[i],
                      tileType: _tileTypes[i % 7],
                    ),
                  ),
              ],
            );
          } else {
            return Center(
              child: Text('empty'.tr, style: titleTextStyle.copyWith(fontSize: 24, color: const Color(0xFF00C897))),
            );
          }
        }),
      ),
    );
  }
}
