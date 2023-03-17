import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/%20services/journal_service.dart';
import 'package:flutter_webapi_first_course/helpers/weekday.dart';

import '../../models/journal.dart';

class AddJournalscreen extends StatelessWidget {
  final Journal journal;
  AddJournalscreen({Key? key, required this.journal}) : super(key: key);

  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(WeekDay(journal.createdAt).toString()
        ),
        actions: [
          IconButton(
            onPressed: () {
              registerJournal(context);
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _contentController,
          keyboardType: TextInputType.multiline,
          style: const TextStyle(fontSize: 24),
          expands: true,
          maxLines: null,
          minLines: null,
        ),
      ),
    );
  }

  registerJournal(BuildContext context) {
    String content = _contentController.text;

    journal.content = content;

    JournalService service = JournalService();
    service.register(journal).then((value) {
      Navigator.pop(context, value);
    });


  }
}
