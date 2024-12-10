import 'package:flutter/material.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  static const String routeName = "/reservation";

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int? _idDoctor;
  String? _doctor;
  String? _specialty;

  String? _patientName;
  String? _patientDNI;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getArguments();
    });
  }

  void _getArguments() {
    if (ModalRoute.of(context)!.settings.arguments == null) return;
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    _idDoctor = arguments["id"] ?? 0;
    _doctor = arguments["doctor"] ?? "";
    _specialty = arguments["specialty"] ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reservar"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    initialValue: _doctor,
                    decoration: const InputDecoration(
                      labelText: "Doctor",
                    ),
                    enabled: false,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: _specialty,
                    decoration: const InputDecoration(
                      labelText: "Especialidad",
                    ),
                    enabled: false,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Nombre del paciente",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "El nombre del paciente es requerido";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _patientName = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "DNI del paciente",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "El DNI del paciente es requerido";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _patientDNI = value;
                    },
                  ),
                ],
              ),
            )),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: FilledButton(
            onPressed: () async {
              if (!_formKey.currentState!.validate()) {
                return;
              }
              _formKey.currentState!.save();
              print("Reservar");
              print("Doctor: $_doctor");
              print("Especialidad: $_specialty");
              print("Nombre del paciente: $_patientName");
              print("DNI del paciente: $_patientDNI");
              _isLoading = true;
              setState(() {});
              await Future.delayed(const Duration(seconds: 2));
              if (!context.mounted) return;
              Navigator.pop(context);
            },
            child: const Text("Reservar"),
          ),
        ),
      ),
    );
  }
}
