// Crear el notifier que define el tema global entre light y dark
// https://medium.com/@press_f_for_flutter/flutter-provider-understanding-application-part-1-78f54a4396e2

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
  List<MedicalServiceModel> _services = [];

  Future<void> getServices() async {
    _services = await MedicalServices().getServices();
    notifyListeners();
  }

  List<MedicalServiceModel> get services => _services;

}

/// El provider siempre debe estar declarado en un widget padre -> MaterialApp