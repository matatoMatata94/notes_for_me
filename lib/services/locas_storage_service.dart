import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final SharedPreferences _preferences;

  LocalStorageService(this._preferences);

  List<String>? get notes => _preferences.getStringList('notes');

  Future<void> saveNotes(List<String> notes) async {
    await _preferences.setStringList('notes', notes);
  }
}
