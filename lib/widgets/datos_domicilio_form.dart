import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba_widgets/widgets/shared/custom_card.dart';
import 'package:prueba_widgets/widgets/shared/custom_form_field.dart';

class DatosDomicilioForm extends StatefulWidget {
  const DatosDomicilioForm({super.key});

  @override
  State<DatosDomicilioForm> createState() => _DatosDomicilioFormState();
}

class _DatosDomicilioFormState extends State<DatosDomicilioForm> {
  final _formKey = GlobalKey<FormState>();
  final _coloniaController = TextEditingController();
  final _calleController = TextEditingController();
  final _numeroExteriorController = TextEditingController();
  final _numeroInteriorController = TextEditingController();
  final _codigoPostalController = TextEditingController();
  final _estadoController = TextEditingController();

  @override
  void dispose() {
    _coloniaController.dispose();
    _calleController.dispose();
    _numeroExteriorController.dispose();
    _numeroInteriorController.dispose();
    _codigoPostalController.dispose();
    _estadoController.dispose();
    super.dispose();
  }

  String? _validateColonia(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor, ingresa la colonia';
    }
    return null;
  }

  String? _validateCalle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor, ingresa el nombre de la calle';
    }
    return null;
  }

  String? _validateNumeroExterior(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor, ingresa el número exterior';
    }
    return null;
  }

  String? _validateEstado(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor, ingresa la estado';
    }
    return null;
  }

  String? _validateCodigoPostal(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor, ingresa el código postal';
    }
    if (value.length != 5) {
      return 'El código postal debe tener 5 dígitos';
    }
    if (int.tryParse(value) == null) {
      return 'Ingresa solo números';
    }
    return null;
  }

  _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text('¡Éxito!'),
            content: const Text('Se enviaron los datos correctamente.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _coloniaController.clear();
                  _calleController.clear();
                  _numeroExteriorController.clear();
                  _numeroInteriorController.clear();
                  _codigoPostalController.clear();
                  _estadoController.clear();
                  _formKey.currentState!.reset();
                },
                child: const Text("Aceptar"),
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: CustomCard(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Datos de Domicilio',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  controller: _estadoController,
                  labelText: 'Estado',
                  hintText: 'Ingresa el estado',
                  prefixIcon: Icons.map_outlined,
                  validator: _validateEstado,
                ),
                CustomFormField(
                  controller: _coloniaController,
                  labelText: 'Colonia',
                  hintText: 'Ingresa la colonia',
                  prefixIcon: Icons.maps_home_work_sharp,
                  validator: _validateColonia,
                ),
                CustomFormField(
                  controller: _calleController,
                  labelText: 'Calle',
                  hintText: 'Ingresa el nombre de la calle',
                  prefixIcon: Icons.place_outlined,
                  validator: _validateCalle,
                ),
                CustomFormField(
                  controller: _numeroExteriorController,
                  labelText: 'Número Exterior',
                  hintText: 'Ingresa el número exterior',
                  prefixIcon: Icons.house_outlined,
                  validator: _validateNumeroExterior,
                ),
                CustomFormField(
                  controller: _numeroInteriorController,
                  labelText: 'Número Interior (Opcional)',
                  hintText: 'Ingresa el número interior',
                  prefixIcon: Icons.house_outlined,
                ),
                CustomFormField(
                  controller: _codigoPostalController,
                  labelText: 'Código Postal',
                  hintText: 'Ingresa el código postal',
                  prefixIcon: Icons.numbers_outlined,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(5),
                  ],
                  validator: _validateCodigoPostal,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Enviar Datos'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
