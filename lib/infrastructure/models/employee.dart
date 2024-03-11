// To parse this JSON data, do
//
//     final employee = employeeFromJson(jsonString);

import 'dart:convert';

List<Employee> employeeFromJson(String str) => List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
    final int id;
    final String tipoIdentidad;
    final String numIdentidad;
    final String nombre;
    final String apellido;
    final String correo;
    final String telefono;
    final String ciudad;
    final String direccion;
    final DateTime fechaIngreso;
    final bool estado;
    final bool estadoOcupado;
    final DateTime createdAt;
    final DateTime updatedAt;
    final List<dynamic> asignarProcesoEmpleados;

    Employee({
        required this.id,
        required this.tipoIdentidad,
        required this.numIdentidad,
        required this.nombre,
        required this.apellido,
        required this.correo,
        required this.telefono,
        required this.ciudad,
        required this.direccion,
        required this.fechaIngreso,
        required this.estado,
        required this.estadoOcupado,
        required this.createdAt,
        required this.updatedAt,
        required this.asignarProcesoEmpleados,
    });

    factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        tipoIdentidad: json["tipoIdentidad"],
        numIdentidad: json["numIdentidad"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        correo: json["correo"],
        telefono: json["telefono"],
        ciudad: json["ciudad"],
        direccion: json["direccion"],
        fechaIngreso: DateTime.parse(json["fechaIngreso"]),
        estado: json["estado"],
        estadoOcupado: json["estadoOcupado"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        asignarProcesoEmpleados: List<dynamic>.from(json["asignarProcesoEmpleados"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipoIdentidad": tipoIdentidad,
        "numIdentidad": numIdentidad,
        "nombre": nombre,
        "apellido": apellido,
        "correo": correo,
        "telefono": telefono,
        "ciudad": ciudad,
        "direccion": direccion,
        "fechaIngreso": "${fechaIngreso.year.toString().padLeft(4, '0')}-${fechaIngreso.month.toString().padLeft(2, '0')}-${fechaIngreso.day.toString().padLeft(2, '0')}",
        "estado": estado,
        "estadoOcupado": estadoOcupado,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "asignarProcesoEmpleados": List<dynamic>.from(asignarProcesoEmpleados.map((x) => x)),
    };
}
