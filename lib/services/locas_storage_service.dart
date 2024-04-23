import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final SharedPreferences _prefs;

  LocalStorageService(this._prefs);

  List<String>? get notes => _prefs.getStringList('notes');

  Future<void> saveNotes(List<String> notes) async {
    await _prefs.setStringList('notes', notes);
  }
}
