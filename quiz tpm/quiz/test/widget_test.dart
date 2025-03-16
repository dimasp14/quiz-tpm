import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:quiz/main.dart';

void main() {
  setUp(() {
    // Inisialisasi sebelum setiap test
  });

  testWidgets('Counter should start at 0 and increment correctly', (WidgetTester tester) async {
    // Render aplikasi
    await tester.pumpWidget(const MyApp());

    // Pastikan counter dimulai dari 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tekan tombol tambah 3 kali
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Pastikan counter berubah menjadi 3
    expect(find.text('0'), findsNothing);
    expect(find.text('3'), findsOneWidget);
  });
}
