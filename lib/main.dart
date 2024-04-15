import 'package:flutter/material.dart';
import 'package:notes_for_me/services/locas_storage_service.dart';
import 'package:notes_for_me/view/note_list_view.dart';
import 'package:notes_for_me/viewmodel/note_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
        create: (_) async => SharedPreferences.getInstance().then((instance) => SharedPreferencesService(instance)),
        child: Consumer<LocalStorageService>(
        builder: (_, localStorageService, __) {
      return ChangeNotifierProvider(
        create: (context) => NoteViewModel(localStorageService),
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
