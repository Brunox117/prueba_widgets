import 'package:flutter/material.dart';
import 'package:prueba_widgets/widgets/report_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [ReportWidget()],
            ),
          ),
        ),
      ),
    );
  }
}
