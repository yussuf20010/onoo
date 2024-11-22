import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../notes/core/controllers/note_controller.dart';
import '../../../notes/core/models/note_model.dart';
import '../../../notes/ui/pages/home_page.dart';
import '../../../notes/ui/styles/text_styles.dart';
import '../../../notes/ui/widgets/icon_button.dart';

class AddNotePage extends StatefulWidget {
  final bool isUpdate;
  final Note? note;
  const AddNotePage({Key? key, this.isUpdate = false, this.note}) : super(key: key);

  @override
  AddNotePageState createState() => AddNotePageState();
}

class AddNotePageState extends State<AddNotePage> {
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _noteTextController = TextEditingController();
  final NoteController _noteController = Get.find<NoteController>();
  final DateTime _currentDate = DateTime.now();

  @override
  void initState() {
    if (widget.isUpdate) {
      _titleTextController.text = widget.note!.title;
      _noteTextController.text = widget.note!.text;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            _appBar(context),
            _body(context),
          ],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyIconButton(
            onTap: () {
              Get.back();
            },
            icon: Icons.keyboard_arrow_left,
          ),
          MyIconButton(
            onTap: () {
              _validateInput();
            },
            txt: widget.isUpdate ? 'update'.tr : 'save'.tr,
          ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _titleTextController,
            style: const TextStyle(color: Color(0xFF00C897)),
            cursorColor: Colors.black,
            maxLines: 3,
            minLines: 1,
            decoration: InputDecoration(
              hintText: 'title'.tr,
              hintStyle: titleTextStyle.copyWith(color: const Color(0xFF00C897)),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: _noteTextController,
            style: const TextStyle(color: Color(0xFF00C897)),
            cursorColor: Colors.black,
            minLines: 3,
            maxLines: 12,
            decoration: InputDecoration(
              hintText: 'typehint'.tr,
              hintStyle: bodyTextStyle.copyWith(color: const Color(0xFF00C897)),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _validateInput() async {
    bool isNotEmpty = _titleTextController.text.isNotEmpty &&
        _noteTextController.text.isNotEmpty;
    if (isNotEmpty && !widget.isUpdate) {
      _addNoteToDB();
      Get.back();
    } else if (widget.isUpdate &&
        _titleTextController.text != widget.note!.title ||
        _noteTextController.text != widget.note!.text) {
      _updateNote();
      Get.offAll(() => HomePage());
    } else {
      Get.snackbar(
        widget.isUpdate ? 'not_updated'.tr : 'required'.tr,
        widget.isUpdate
            ? 'fields_not_updated'.tr
            : 'all_fields_required'.tr,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
    }
  }

  _addNoteToDB() async {
    await _noteController.addNote(
      note: Note(
        text: _noteTextController.text,
        title: _titleTextController.text,
        date: DateFormat.yMMMd().format(_currentDate).toString(),
      ),
    );
  }

  _updateNote() async {
    await _noteController.updateNote(
      note: Note(
        id: widget.note!.id,
        text: _noteTextController.text,
        title: _titleTextController.text,
        date: DateFormat.yMMMd().format(_currentDate).toString(),
      ),
    );
  }
}
