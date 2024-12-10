import 'package:dio/dio.dart';
import 'package:doctor_app_template/models/doctor_model.dart';
import 'package:doctor_app_template/models/medical_service_model.dart';

class MedicalServices {
  /// Backend - API REST - JSON Server
  /// Backend - GraphQL - Hasura
  /// Backend - Firebase - Firestore - Base de datos no relacionales - colecciones
  /// Backend - Soap - XML https://pub.dev/packages/xml2json

  /// CRUD - Create, Read, Update, Delete
  /// Create - POST
  /// Read - GET
  /// Update - PUT
  /// Delete - DELETE
  ///
  /// PATCH
  /// HEAD
  /// OPTIONS

  /// Consumir  -> Endpoint -> URL -> API REST
  /// URL partes
  /// Protocolo - https
  /// Dominio - my-json-server.typicode.com
  /// Path - RicharC293/fake_doctors/services

  /// Base URL - https://my-json-server.typicode.com/RicharC293/fake_doctors
  /// Endpoint - services

  /// Instancia dio
  final dio = Dio();

  /// Crear un metodo que retorne una lista de servicios medicos
  /// https://my-json-server.typicode.com/RicharC293/fake_doctors/services

  Future<List<MedicalServiceModel>> getServices() async {
    try {
      final response = await dio.get(
          "https://my-json-server.typicode.com/RicharC293/fake_doctors/services");

      /// parseo de la respuesta
      // final data = response.data;
      /// No se rompe por los valores nulos
      if (response.data == null) {
        return [];
      }

      /// Crear una lista de servicios medicos
      final List<MedicalServiceModel> services = (response.data as List)
          .map(
            (service) => MedicalServiceModel.fromJson(service),
          )
          .toList();

      return services;
    } on DioException catch (e) {
      /// timeout
      if (e.type == DioExceptionType.connectionError) {
        print("Timeout");
      }

      return [];

      /// Revisar
    } catch (e) {
      print(e);
      return [];
    }
  }

  /// Crear un metodo que retorne una lista de doctores
  /// https://my-json-server.typicode.com/RicharC293/fake_doctors/doctors

  Future<List<DoctorModel>> getDoctors() async {
    try {
      final response = await dio.get(
          "https://my-json-server.typicode.com/RicharC293/fake_doctors/doctors");

      /// parseo de la respuesta
      // final data = response.data;
      /// No se rompe por los valores nulos
      if (response.data == null) {
        return [];
      }

      /// Crear una lista de doctores
      final List<DoctorModel> doctors = (response.data as List)
          .map(
            (doctor) => DoctorModel.fromJson(doctor),
          )
          .toList();

      return doctors;

      /// Revisar
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> createDate({
    required int idDoctor,
    required String patientName,
    required String patientDNI,
  }) async {
    try {
      final response = await dio.post(
        "https://my-json-server.typicode.com/RicharC293/fake_doctors/reservations",
        data: {
          "idDoctor": idDoctor,
          "patientName": patientName,
          "patientDNI": patientDNI,
        },
      );

      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
