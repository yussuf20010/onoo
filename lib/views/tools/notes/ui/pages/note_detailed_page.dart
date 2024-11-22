import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../notes/core/controllers/note_controller.dart';
import '../../../notes/core/models/note_model.dart';
import '../../../notes/ui/pages/add_note_page.dart';
import '../../../notes/ui/styles/colors.dart';
import '../../../notes/ui/styles/text_styles.dart';
import '../../../notes/ui/widgets/icon_button.dart';

class NoteDetailPage extends StatelessWidget {
  final Note note;
  final _noteController = Get.find<NoteController>();
  NoteDetailPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF00C897),
          onPressed: () {
            Get.to(() => AddNotePage(
                  isUpdate: true,
                  note: note,
                ));
          },
          child: const Icon(Icons.edit,color: Colors.white,),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            _body(),
          ],
        ),
      ),
    );
  }

  _appBar() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
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
              _deleteNoteFromDB();
              Get.back();
            },
            icon: Icons.delete,
          ),
        ],
      ),
    );
  }

  _body() {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: note.title,
                    style: GoogleFonts.lato(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF00B085),
                      // Add other font styling properties as needed
                    ),
                  ),
                  // You can add more TextSpan elements for additional text with different styles here.
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: note.date,
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF00B085),
                      // Add other font styling properties as needed
                    ),
                  ),
                  // You can add more TextSpan elements for additional text with different styles here.
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: note.text,
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF00B085),
                              // Add other font styling properties as needed
                            ),
                          ),
                          // You can add more TextSpan elements for additional text with different styles here.
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _deleteNoteFromDB() async {
    await _noteController.deleteNote(note: note);
  }
}
