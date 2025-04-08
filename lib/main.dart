import 'package:flutter/material.dart';
import 'package:prueba_widgets/widgets/actualizar_ubicacion.dart';
import 'package:prueba_widgets/widgets/ajustador_widget.dart';
import 'package:prueba_widgets/widgets/arribo_ajustador.dart';
import 'package:prueba_widgets/widgets/chabot/chat_bot.dart';
import 'package:prueba_widgets/widgets/cliente_widget.dart';
import 'package:prueba_widgets/widgets/curp_form.dart';
import 'package:prueba_widgets/widgets/datos_contacto_form.dart';
import 'package:prueba_widgets/widgets/datos_domicilio_form.dart';
import 'package:prueba_widgets/widgets/datos_generales_form.dart';
import 'package:prueba_widgets/widgets/image_gallery.dart';
import 'package:prueba_widgets/widgets/llamar_ajustador_widget.dart';
import 'package:prueba_widgets/widgets/llamar_asegurado.dart';
import 'package:prueba_widgets/widgets/llamar_cabina_widget.dart';
import 'package:prueba_widgets/widgets/lugar_siniestro_widget.dart';
import 'package:prueba_widgets/widgets/marcar_arribo_widget.dart';
import 'package:prueba_widgets/widgets/marcar_termino.dart';
import 'package:prueba_widgets/widgets/report_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.0),
              child: Column(
                children: [
                  ArriboAjustador(),
                  ChatBot(),
                  AjustadorWidget(),
                  ClienteWidget(),
                  ActualizarUbicacion(),
                  LlamarAjustadorWidget(),
                  LlamarCabinaWidget(),
                  LlamarAsegurado(),
                  MarcarArriboWidget(),
                  MarcarTermino(),
                  LugarSiniestroWidget(),
                  DatosContactoForm(),
                  DatosGeneralesForm(),            
                  DatosDomicilioForm(),
                  CurpForm(),
                  ImageGallery(),
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
