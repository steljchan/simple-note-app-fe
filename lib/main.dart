import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/note_bloc.dart';
import 'bloc/note_event.dart';
import 'ui/note_list_page.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => NoteBloc()..add(FetchNotes()),
      child: const MaterialApp(
        home: NoteListPage(),
      ),
    ),
  );
}
