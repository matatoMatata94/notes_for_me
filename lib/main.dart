import 'package:flutter/material.dart';
import 'package:notes_for_me/services/locas_storage_service.dart';
import 'package:notes_for_me/view/note_list_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  LocalStorageService localStorageService = LocalStorageService(prefs);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (_) => ,
      initialData: null,
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
