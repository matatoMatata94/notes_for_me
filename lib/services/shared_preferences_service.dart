import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _preferences;

  SharedPreferencesService(this._preferences);

  List<String>? get notes => _preferences.getStringList('notes');

  Future<void> saveNotes(List<String> notes) async {
    await _preferences.setStringList('notes', notes);
  }
}
