import 'package:doctor_app_template/notifier/theme_notifier.dart';
import 'package:doctor_app_template/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  static const String routeName = "/reservation";

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int? _idDoctor;

  /// Se crean controladores para los inputs
  late TextEditingController _patientNameController;
  late TextEditingController _patientDNIController;

  late TextEditingController _doctorNameController;
  late TextEditingController _specialtyController;

  @override
  void initState() {
    super.initState();
    _patientNameController = TextEditingController();
    _patientDNIController = TextEditingController();
    _doctorNameController = TextEditingController();
    _specialtyController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getArguments();
    });
  }

  void _getArguments() {
    if (ModalRoute.of(context)!.settings.arguments == null) return;
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    _idDoctor = arguments["id"] ?? 0;
    _doctorNameController.text = arguments["doctor"] ?? "";
    _specialtyController.text = arguments["specialty"] ?? "";
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
                    controller: _doctorNameController,
                    decoration: const InputDecoration(
                      labelText: "Doctor",
                    ),
                    enabled: false,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _specialtyController,
                    decoration: const InputDecoration(
                      labelText: "Especialidad",
                    ),
                    enabled: false,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _patientNameController,
                    decoration: const InputDecoration(
                      labelText: "Nombre del paciente",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "El nombre del paciente es requerido";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _patientDNIController,
                    decoration: const InputDecoration(
                      labelText: "DNI del paciente",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "El DNI del paciente es requerido";
                      }
                      return null;
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
              if (context.read<ThemeNotifier>().isLoading) return;

              if (_idDoctor == null) return;

              if (!_formKey.currentState!.validate()) {
                return;
              }
              await context.read<ThemeNotifier>().createDate(
                    idDoctor: _idDoctor!,
                    patientName: _patientNameController.text,
                    patientDNI: _patientDNIController.text,
                  );
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Reserva realizada con éxito"),
                ),
              );
              Navigator.pop(context);
            },
            child: Selector<ThemeNotifier, bool>(
              selector: (_, notifier) => notifier.isLoading,
              builder: (_, isLoading, __) {
                if (isLoading) {
                  return const SizedBox(
                    height: 10,
                    width: 10,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
                return const Text("Reservar");
              },
            ),
          ),
        ),
      ),
    );
  }
}
