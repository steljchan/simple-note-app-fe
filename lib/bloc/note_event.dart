import 'package:equatable/equatable.dart';

abstract class NoteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchNotes extends NoteEvent {}

class AddNote extends NoteEvent {
  final String title;
  final String content;

  AddNote(this.title, this.content);

  @override
  List<Object?> get props => [title, content];
}

class UpdateNote extends NoteEvent {
  final int id;
  final String title;
  final String content;

  UpdateNote(this.id, this.title, this.content);

  @override
  List<Object?> get props => [id, title, content];
}

class DeleteNote extends NoteEvent {
  final int id;

  DeleteNote(this.id);

  @override
  List<Object?> get props => [id];
}
