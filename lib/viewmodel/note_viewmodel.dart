import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notes_for_me/models/note.dart';
import 'package:notes_for_me/services/locas_storage_service.dart';

class NoteViewModel extends ChangeNotifier {
  List<Note> _notes = [];
  LocalStorageService _localStorageService;

  List<Note> get notes => _notes;

  NoteViewModel(this._localStorageService) {
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final notesData = _localStorageService.notes;
    if (notesData != null) {
      _notes =
          notesData.map((json) => Note.fromJson(jsonDecode(json))).toList();
      notifyListeners();
    }
  }

  Future<void> _saveNotes() async {
    final notesData = _notes.map((note) => jsonEncode(note.toJson())).toList();
    await _localStorageService.saveNotes(notesData);
  }

  void addNote(Note note) {
    _notes.add(note);
    _saveNotes();
    notifyListeners();
  }

  void deleteNote(Note note) {
    _notes.remove(note);
    _saveNotes();
    notifyListeners();
  }
}
