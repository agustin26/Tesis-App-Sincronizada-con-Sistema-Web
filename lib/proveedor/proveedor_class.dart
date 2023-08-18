// To parse this JSON data, do
//
//     final proveedor = proveedorFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Proveedor> proveedorFromJson(String str) => List<Proveedor>.from(json.decode(str).map((x) => Proveedor.fromJson(x)));

String proveedorToJson(List<Proveedor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Proveedor {
    String idProveedor;
    String cuitProveedor;
    String nombreProveedor;
    String telefonoProveedor;
    String correoProveedor;
    String direccionProveedor;
    DateTime fechaAltaProveedor;
    String estadoProveedor;
    String idUsuario;

    Proveedor({
        required this.idProveedor,
        required this.cuitProveedor,
        required this.nombreProveedor,
        required this.telefonoProveedor,
        required this.correoProveedor,
        required this.direccionProveedor,
        required this.fechaAltaProveedor,
        required this.estadoProveedor,
        required this.idUsuario,
    });

    factory Proveedor.fromJson(Map<String, dynamic> json) => Proveedor(
        idProveedor: json["id_proveedor"],
        cuitProveedor: json["cuit_proveedor"],
        nombreProveedor: json["nombre_proveedor"],
        telefonoProveedor: json["telefono_proveedor"],
        correoProveedor: json["correo_proveedor"],
        direccionProveedor: json["direccion_proveedor"],
        fechaAltaProveedor: DateTime.parse(json["fecha_alta_proveedor"]),
        estadoProveedor: json["estado_proveedor"],
        idUsuario: json["id_usuario"],
    );

    Map<String, dynamic> toMap() => {
        "id_proveedor": idProveedor,
        "cuit_proveedor": cuitProveedor,
        "nombre_proveedor": nombreProveedor,
        "telefono_proveedor": telefonoProveedor,
        "correo_proveedor": correoProveedor,
        "direccion_proveedor": direccionProveedor,
        "fecha_alta_proveedor": "${fechaAltaProveedor.year.toString().padLeft(4, '0')}-${fechaAltaProveedor.month.toString().padLeft(2, '0')}-${fechaAltaProveedor.day.toString().padLeft(2, '0')}",
        "estado_proveedor": estadoProveedor,
        "id_usuario": idUsuario,
    };
}
