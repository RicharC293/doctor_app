// Crear el notifier que define el tema global entre light y dark
// https://medium.com/@press_f_for_flutter/flutter-provider-understanding-application-part-1-78f54a4396e2

import 'package:doctor_app_template/models/doctor_model.dart';
import 'package:doctor_app_template/models/medical_service_model.dart';
import 'package:doctor_app_template/services/medical_services.dart';
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  /// Variables -> tema oscuro y tema claro
  /// List<MedicalServiceModel> -> servicios médicos

  /// Inicializado en false
  /// Como privado
  bool _isDark = false;

  /// Getter -> obtener el valor de _isDark
  bool get isDark => _isDark;

  /// Setter -> cambiar el valor de _isDark
  set isDark(bool value) {
    _isDark = value;

    /// Notificar a los widgets que estén escuchando
    notifyListeners();
  }

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  /// Consultar el endpoint de servicios médicos
  /// Separar la lógica de la vista

  /// Guarda la lista de servicios médicos
  List<MedicalServiceModel> _services = [];

  /// Guarda la lista de doctores
  List<DoctorModel> _doctors = [];

  List<DoctorModel> _filteredDoctors = [];

  /// Estado de carga
  /// Inicializado en false
  bool _isLoading = false;

  List<MedicalServiceModel> get services => _services;

  List<DoctorModel> get filteredDoctors => _filteredDoctors;

  bool get isLoading => _isLoading;

  Future<void> getServices() async {
    _services = await MedicalServices().getServices();
  }

  Future<void> getDoctors() async {
    _doctors = await MedicalServices().getDoctors();
    _filteredDoctors = List.from(_doctors);
  }

  /// Se usa para cargar los datos de los servicios médicos y los doctores
  Future<void> initData() async {
    _isLoading = true;

    /// Sirve para esperar a que se resuelvan las dos peticiones,
    /// ambas se resuelven al mismo tiempo, se optimiza el tiempo
    await Future.wait([getServices(), getDoctors()]);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> filterDoctorsByName(String name) async {
    if (name.isEmpty) {
      _filteredDoctors = List.from(_doctors);
    } else {
      _filteredDoctors = _doctors
          .where((doctor) =>
              doctor.name.toLowerCase().contains(name.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  Future<void> createDate({
    required int idDoctor,
    required String patientName,
    required String patientDNI,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      await MedicalServices().createDate(
        idDoctor: idDoctor,
        patientName: patientName,
        patientDNI: patientDNI,
      );
    } catch (e) {
      print(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

/// El provider siempre debe estar declarado en un widget padre -> MaterialApp
