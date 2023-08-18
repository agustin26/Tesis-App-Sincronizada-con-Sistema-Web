// To parse this JSON data, do
//
//     final cuentas = cuentasFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Cuentas> cuentasFromJson(String str) => List<Cuentas>.from(json.decode(str).map((x) => Cuentas.fromJson(x)));

String cuentasToJson(List<Cuentas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Cuentas {
    String idCuentasCorrientes;
    String idCliente;
    String saldoCc;
    String estadoCc;
    String dniCliente;
    String nombreCliente;
    String apellidoCliente;
    String telefonoCliente;
    String direccionCliente;
    DateTime fechaAltaCliente;
    String estadoCliente;
    String idUsuario;

    Cuentas({
        required this.idCuentasCorrientes,
        required this.idCliente,
        required this.saldoCc,
        required this.estadoCc,
        required this.dniCliente,
        required this.nombreCliente,
        required this.apellidoCliente,
        required this.telefonoCliente,
        required this.direccionCliente,
        required this.fechaAltaCliente,
        required this.estadoCliente,
        required this.idUsuario,
    });

    factory Cuentas.fromJson(Map<String, dynamic> json) => Cuentas(
        idCuentasCorrientes: json["id_cuentas_corrientes"],
        idCliente: json["id_cliente"],
        saldoCc: json["saldo_cc"],
        estadoCc: json["estado_cc"],
        dniCliente: json["dni_cliente"],
        nombreCliente: json["nombre_cliente"],
        apellidoCliente: json["apellido_cliente"],
        telefonoCliente: json["telefono_cliente"],
        direccionCliente: json["direccion_cliente"],
        fechaAltaCliente: DateTime.parse(json["fecha_alta_cliente"]),
        estadoCliente: json["estado_cliente"],
        idUsuario: json["id_usuario"],
    );

    Map<String, dynamic> toMap() => {
        "id_cuentas_corrientes": idCuentasCorrientes,
        "id_cliente": idCliente,
        "saldo_cc": saldoCc,
        "estado_cc": estadoCc,
        "dni_cliente": dniCliente,
        "nombre_cliente": nombreCliente,
        "apellido_cliente": apellidoCliente,
        "telefono_cliente": telefonoCliente,
        "direccion_cliente": direccionCliente,
        "fecha_alta_cliente": "${fechaAltaCliente.year.toString().padLeft(4, '0')}-${fechaAltaCliente.month.toString().padLeft(2, '0')}-${fechaAltaCliente.day.toString().padLeft(2, '0')}",
        "estado_cliente": estadoCliente,
        "id_usuario": idUsuario,
    };
}
