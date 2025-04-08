import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba_widgets/widgets/shared/custom_card.dart';
import 'package:prueba_widgets/widgets/shared/custom_form_field.dart';

class DatosGeneralesForm extends StatefulWidget {
  const DatosGeneralesForm({super.key});

  @override
  State<DatosGeneralesForm> createState() => _DatosGeneralesFormState();
}

class _DatosGeneralesFormState extends State<DatosGeneralesForm> {
  final _formKey = GlobalKey<FormState>();
  final _nombresController = TextEditingController();
  final _apellidoPaternoController = TextEditingController();
  final _apellidoMaternoController = TextEditingController();
  final _edadController = TextEditingController();
  String? _selectedSexo;
  DateTime? _fechaNacimiento;

  @override
  void dispose() {
    _nombresController.dispose();
    _apellidoPaternoController.dispose();
    _apellidoMaternoController.dispose();
    _edadController.dispose();
    super.dispose();
  }

  String? _validateNombres(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor, ingresa tu(s) nombre(s)';
    }
    return null;
  }

  String? _validateApellidoPaterno(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor, ingresa tu apellido paterno';
    }
    return null;
  }

  String? _validateApellidoMaterno(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor, ingresa tu apellido materno';
    }
    return null;
  }

  String? _validateEdad(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor, ingresa tu edad';
    }
    final edad = int.tryParse(value);
    if (edad == null) {
      return 'Ingresa solo números';
    }
    if (edad < 0 || edad > 120) {
      return 'Ingresa una edad válida';
    }
    return null;
  }

  String? _validateSexo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, selecciona tu sexo';
    }
    return null;
  }

  String? _validateFechaNacimiento(DateTime? value) {
    if (value == null) {
      return 'Por favor, selecciona tu fecha de nacimiento';
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
                  _nombresController.clear();
                  _apellidoPaternoController.clear();
                  _apellidoMaternoController.clear();
                  _edadController.clear();
                  setState(() {
                    _selectedSexo = null;
                    _fechaNacimiento = null;
                  });
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _fechaNacimiento) {
      setState(() {
        _fechaNacimiento = picked;
      });
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
                  'Datos Generales',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  controller: _nombresController,
                  labelText: 'Nombre(s)',
                  hintText: 'Ingresa tu(s) nombre(s)',
                  prefixIcon: Icons.person_outline,
                  validator: _validateNombres,
                ),
                CustomFormField(
                  controller: _apellidoPaternoController,
                  labelText: 'Apellido Paterno',
                  hintText: 'Ingresa tu apellido paterno',
                  prefixIcon: Icons.person_outline,
                  validator: _validateApellidoPaterno,
                ),
                CustomFormField(
                  controller: _apellidoMaternoController,
                  labelText: 'Apellido Materno',
                  hintText: 'Ingresa tu apellido materno',
                  prefixIcon: Icons.person_outline,
                  validator: _validateApellidoMaterno,
                ),
                CustomFormField(
                  controller: _edadController,
                  labelText: 'Edad',
                  hintText: 'Ingresa tu edad',
                  prefixIcon: Icons.calendar_today_outlined,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                  ],
                  validator: _validateEdad,
                ),
                DropdownButtonFormField<String>(
                  value: _selectedSexo,
                  decoration: const InputDecoration(
                    labelText: 'Sexo',
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'Masculino', child: Text('Masculino')),
                    DropdownMenuItem(value: 'Femenino', child: Text('Femenino')),
                    DropdownMenuItem(value: 'Otro', child: Text('Otro')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedSexo = value;
                    });
                  },
                  validator: _validateSexo,
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () => _selectDate(context),
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Fecha de Nacimiento',
                      prefixIcon: Icon(Icons.calendar_today_outlined),
                      border: OutlineInputBorder(),
                    ),
                    child: Text(
                      _fechaNacimiento != null
                          ? '${_fechaNacimiento!.day}/${_fechaNacimiento!.month}/${_fechaNacimiento!.year}'
                          : 'Selecciona tu fecha de nacimiento',
                    ),
                  ),
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