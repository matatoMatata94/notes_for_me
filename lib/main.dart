import 'package:flutter/material.dart';
import 'package:notes_for_me/services/shared_preferences_service.dart';
import 'package:notes_for_me/view/note_list_view.dart';
import 'package:notes_for_me/viewmodel/note_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<SharedPreferencesService>(
      create: (_) async =>
          SharedPreferencesService(await SharedPreferences.getInstance()),
      child: ChangeNotifierProvider(
        create: (context) => NoteViewModel(),
        child: MaterialApp(
          title: 'Notes App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: NoteListView(),
        ),
      ),
    );
  }
}
