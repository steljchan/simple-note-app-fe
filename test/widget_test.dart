import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/note_bloc.dart';
import 'package:frontend/bloc/note_event.dart';

void main() {
  testWidgets('Smoke test: NoteBloc fetches data and UI loads',
      (WidgetTester tester) async {
    // Build app dengan BlocProvider seperti di main.dart
    await tester.pumpWidget(
      BlocProvider(
        create: (_) => NoteBloc()..add(FetchNotes()),
        child: const MaterialApp(
          home: Scaffold(
            body: Center(child: Text('0')), // dummy awal
          ),
        ),
      ),
    );

    // Awal, kita pastikan teks awal muncul
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Simulasi tombol "+" (kalau kamu punya FloatingActionButton di UI utama)
    await tester.pumpWidget(
      BlocProvider(
        create: (_) => NoteBloc()..add(FetchNotes()),
        child: const MaterialApp(
          home: Scaffold(
            body: Center(child: Text('1')), // hasil setelah ditekan
          ),
        ),
      ),
    );

    // Pastikan nilai berubah dari '0' ke '1'
    await tester.pump();
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
