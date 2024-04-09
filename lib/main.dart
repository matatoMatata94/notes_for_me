import 'package:flutter/material.dart';
import 'package:notes_for_me/view/note_list_view.dart';
import 'package:notes_for_me/viewmodel/note_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteViewModel(),
      child: MaterialApp(
        title: 'Notes App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NoteListView(),
      ),
    );
  }
}
