import 'package:flutter/material.dart';
import 'package:notes_for_me/models/note.dart';
import 'package:notes_for_me/viewmodel/note_viewmodel.dart';
import 'package:provider/provider.dart';

class NoteListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final noteViewModel = Provider.of<NoteViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: ListView.builder(
        itemCount: noteViewModel.notes.length,
        itemBuilder: (context, index) {
          final note = noteViewModel.notes[index];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.content),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                noteViewModel.deleteNote(note);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          noteViewModel.addNote(Note(
            id: DateTime.now().toString(),
            title: 'New Note',
            content: 'Note Content',
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
