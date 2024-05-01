import 'package:flutter/material.dart';
import 'package:notes_for_me/services/locas_storage_service.dart';
import 'package:notes_for_me/view/note_list_view.dart';
import 'package:notes_for_me/viewmodel/note_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  LocalStorageService localStorageService = LocalStorageService(prefs);
  runApp(
    MultiProvider(
      providers: [
        FutureProvider<LocalStorageService>.value(
          value: Future.value(localStorageService),
          initialData: localStorageService,
        ),
        ChangeNotifierProvider<NoteViewModel>(
          create: (_) => NoteViewModel(localStorageService),
        ),
      ],
      child: MyApp(
        localStorageService: localStorageService,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final LocalStorageService localStorageService;

  MyApp({required this.localStorageService});

  @override
  Widget build(BuildContext context) {
    return FutureProvider<LocalStorageService>(
      create: (_) => Future.value(localStorageService),
      initialData: localStorageService,
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
