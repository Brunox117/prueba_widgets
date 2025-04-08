import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba_widgets/widgets/shared/custom_card.dart';
import 'package:prueba_widgets/widgets/shared/custom_form_field.dart';

class CurpForm extends StatefulWidget {
  const CurpForm({super.key});

  @override
  State<CurpForm> createState() => _CurpFormState();
}

class _CurpFormState extends State<CurpForm> {
  final _formKey = GlobalKey<FormState>();
  final _curpController = TextEditingController();

  @override
  void dispose() {
    _curpController.dispose();
    super.dispose();
  }

  String? _validateCurp(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Por favor, ingresa tu CURP';
    }
    if (value.length != 18) {
      return 'El CURP debe tener 18 caracteres';
    }
    // Basic CURP format validation
    final curpRegex = RegExp(r'^[A-Z]{4}[0-9]{6}[HM][A-Z]{5}[0-9A-Z]{2}$');
    if (!curpRegex.hasMatch(value)) {
      return 'Ingresa un CURP válido';
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
            content: const Text('Se envió el CURP correctamente.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _curpController.clear();
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
                  'CURP',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  controller: _curpController,
                  labelText: 'CURP',
                  hintText: 'Ingresa tu CURP',
                  prefixIcon: Icons.badge_outlined,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                    LengthLimitingTextInputFormatter(18),
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      return TextEditingValue(
                        text: newValue.text.toUpperCase(),
                        selection: newValue.selection,
                      );
                    }),
                  ],
                  validator: _validateCurp,
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
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}