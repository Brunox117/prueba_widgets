import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba_widgets/widgets/shared/custom_card.dart';
import 'package:prueba_widgets/widgets/shared/custom_form_field.dart';

class DatosContactoForm extends StatefulWidget {
  const DatosContactoForm({super.key});

  @override
  State<DatosContactoForm> createState() => _DatosContactoFormState();
}

class _DatosContactoFormState extends State<DatosContactoForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor, ingresa tu nombre';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor, ingresa tu teléfono';
    }
    if (value.length != 10) {
      return 'El teléfono debe tener 10 dígitos';
    }

    if (int.tryParse(value) == null) {
      return 'Ingresa solo números';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor, ingresa tu correo electrónico';
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Ingresa un correo electrónico válido';
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
                    _formKey.currentState!.reset();
                    _nameController.clear();
                    _phoneController.clear();
                    _emailController.clear();
                  },
                  child: const Text("Aceptar"))
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
                  'Datos de Contacto',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  controller: _nameController,
                  labelText: 'Nombre Completo',
                  hintText: 'Ingresa tu nombre',
                  prefixIcon: Icons.person_outline,
                  validator: _validateName,
                ),
                CustomFormField(
                  controller: _phoneController,
                  labelText: 'Teléfono',
                  hintText: 'Ingresa tu número de teléfono',
                  prefixIcon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  validator: _validatePhone,
                ),
                CustomFormField(
                  controller: _emailController,
                  labelText: 'Correo Electrónico',
                  hintText: 'Ingresa tu email',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  child: const Text('Enviar Datos'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
