import 'package:flutter/material.dart';
import 'package:prueba_widgets/widgets/actualizar_ubicacion.dart';
import 'package:prueba_widgets/widgets/ajustador_widget.dart';
import 'package:prueba_widgets/widgets/arribo_ajustador.dart';
import 'package:prueba_widgets/widgets/cliente_widget.dart';
import 'package:prueba_widgets/widgets/llamar_ajustador_widget.dart';
import 'package:prueba_widgets/widgets/llamar_cabina_widget.dart';
import 'package:prueba_widgets/widgets/marcar_arribo_widget.dart';
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.0),
              child: Column(
                children: [
                  ArriboAjustador(),
                  AjustadorWidget(),
                  ClienteWidget(),
                  ActualizarUbicacion(),
                  LlamarAjustadorWidget(),
                  LlamarCabinaWidget(),
                  MarcarArriboWidget(),
                  ReportWidget(
                    reporte: '89992',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
