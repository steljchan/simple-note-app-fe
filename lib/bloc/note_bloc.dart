import 'package:flutter_bloc/flutter_bloc.dart';
import 'note_event.dart';
import 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteInitial()) {
    on<FetchNotes>(_onFetchNotes);
    on<AddNote>(_onAddNote);
    on<UpdateNote>(_onUpdateNote);
    on<DeleteNote>(_onDeleteNote);
  }

  final List<Map<String, dynamic>> _notes = [
    {"id": 1, "title": "Catatan 1", "content": "Isi catatan pertama"},
    {"id": 2, "title": "Catatan 2", "content": "Isi catatan kedua"},
    {"id": 3, "title": "Catatan 3", "content": "Isi catatan ketiga"},
  ];

  Future<void> _onFetchNotes(FetchNotes event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    await Future.delayed(const Duration(seconds: 1)); // simulasi loading
    emit(NoteLoaded(List<Map<String, dynamic>>.from(_notes)));
  }

  void _onAddNote(AddNote event, Emitter<NoteState> emit) {
    final newId = _notes.isEmpty ? 1 : (_notes.last['id'] as int) + 1;
    final newNote = {
      "id": newId,
      "title": event.title,
      "content": event.content,
    };
    _notes.add(newNote);
    emit(NoteLoaded(List<Map<String, dynamic>>.from(_notes)));
  }

  void _onUpdateNote(UpdateNote event, Emitter<NoteState> emit) {
    final index = _notes.indexWhere((note) => note['id'] == event.id);
    if (index != -1) {
      _notes[index] = {
        "id": event.id,
        "title": event.title,
        "content": event.content,
      };
      emit(NoteLoaded(List<Map<String, dynamic>>.from(_notes)));
    }
  }

  void _onDeleteNote(DeleteNote event, Emitter<NoteState> emit) {
    _notes.removeWhere((note) => note['id'] == event.id);
    emit(NoteLoaded(List<Map<String, dynamic>>.from(_notes)));
  }
}
