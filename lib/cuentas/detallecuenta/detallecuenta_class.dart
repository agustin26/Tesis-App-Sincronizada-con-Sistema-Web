// To parse this JSON data, do
//
//     final detallecuentas = detallecuentasFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Detallecuentas> detallecuentasFromJson(String str) => List<Detallecuentas>.from(json.decode(str).map((x) => Detallecuentas.fromJson(x)));

String detallecuentasToJson(List<Detallecuentas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Detallecuentas {
    String idDetalleCc;
    String idCuentaCorriente;
    String idVentas;
    DateTime fechaDetalleCc;
    String montoDetalleCc;
    String idCliente;
    String idUsuario;
    String descripcionDetalleCc;
    String tipoMovimientoDetalleCc;
    String dniCliente;
    String nombreCliente;
    String apellidoCliente;
    String telefonoCliente;
    String direccionCliente;
    DateTime fechaAltaCliente;
    String estadoCliente;

    Detallecuentas({
        required this.idDetalleCc,
        required this.idCuentaCorriente,
        required this.idVentas,
        required this.fechaDetalleCc,
        required this.montoDetalleCc,
        required this.idCliente,
        required this.idUsuario,
        required this.descripcionDetalleCc,
        required this.tipoMovimientoDetalleCc,
        required this.dniCliente,
        required this.nombreCliente,
        required this.apellidoCliente,
        required this.telefonoCliente,
        required this.direccionCliente,
        required this.fechaAltaCliente,
        required this.estadoCliente,
    });

     factory Detallecuentas.fromJson(Map<String, dynamic> json) => Detallecuentas(
        idDetalleCc: json["id_detalle_cc"],
        idCuentaCorriente: json["id_cuenta_corriente"],
        idVentas: json["id_ventas"],
        fechaDetalleCc: DateTime.parse(json["fecha_detalle_cc"]),
        montoDetalleCc: json["monto_detalle_cc"],
        idCliente: json["id_cliente"],
        idUsuario: json["id_usuario"],
        descripcionDetalleCc: json["descripcion_detalle_cc"],
        tipoMovimientoDetalleCc: json["tipo_movimiento_detalle_cc"],
        dniCliente: json["dni_cliente"],
        nombreCliente: json["nombre_cliente"],
        apellidoCliente: json["apellido_cliente"],
        telefonoCliente: json["telefono_cliente"],
        direccionCliente: json["direccion_cliente"],
        fechaAltaCliente: DateTime.parse(json["fecha_alta_cliente"]),
        estadoCliente: json["estado_cliente"],
    );

    Map<String, dynamic> toMap() => {
        "id_detalle_cc": idDetalleCc,
        "id_cuenta_corriente": idCuentaCorriente,
        "id_ventas": idVentas,
        "fecha_detalle_cc": fechaDetalleCc.toIso8601String(),
        "monto_detalle_cc": montoDetalleCc,
        "id_cliente": idCliente,
        "id_usuario": idUsuario,
        "descripcion_detalle_cc": descripcionDetalleCc,
        "tipo_movimiento_detalle_cc": tipoMovimientoDetalleCc,
        "dni_cliente": dniCliente,
        "nombre_cliente": nombreCliente,
        "apellido_cliente": apellidoCliente,
        "telefono_cliente": telefonoCliente,
        "direccion_cliente": direccionCliente,
        "fecha_alta_cliente": "${fechaAltaCliente.year.toString().padLeft(4, '0')}-${fechaAltaCliente.month.toString().padLeft(2, '0')}-${fechaAltaCliente.day.toString().padLeft(2, '0')}",
        "estado_cliente": estadoCliente,
    };
}




// To parse this JSON data, do
//
//     final detallecuentas = detallecuentasFromJson(jsonString);
/*
import 'dart:convert';

List<Detallecuentas> detallecuentasFromJson(String str) => List<Detallecuentas>.from(json.decode(str).map((x) => Detallecuentas.fromJson(x)));

String detallecuentasToJson(List<Detallecuentas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Detallecuentas {
    String idDetalleCc;
    String idCuentaCorriente;
    String idVentas;
    DateTime fechaDetalleCc;
    String montoDetalleCc;
    String estadoDetalleCc;
    String idCliente;
    String idUsuario;
    DateTime fechaPagoDetalleCc;
    String dniCliente;
    String nombreCliente;
    String apellidoCliente;
    String telefonoCliente;
    String direccionCliente;
    DateTime fechaAltaCliente;
    String estadoCliente;

    Detallecuentas({
        required this.idDetalleCc,
        required this.idCuentaCorriente,
        required this.idVentas,
        required this.fechaDetalleCc,
        required this.montoDetalleCc,
        required this.estadoDetalleCc,
        required this.idCliente,
        required this.idUsuario,
        required this.fechaPagoDetalleCc,
        required this.dniCliente,
        required this.nombreCliente,
        required this.apellidoCliente,
        required this.telefonoCliente,
        required this.direccionCliente,
        required this.fechaAltaCliente,
        required this.estadoCliente,
    });

    factory Detallecuentas.fromJson(Map<String, dynamic> json) => Detallecuentas(
        idDetalleCc: json["id_detalle_cc"],
        idCuentaCorriente: json["id_cuenta_corriente"],
        idVentas: json["id_ventas"],
        fechaDetalleCc: DateTime.parse(json["fecha_detalle_cc"]),
        montoDetalleCc: json["monto_detalle_cc"],
        estadoDetalleCc: json["estado_detalle_cc"],
        idCliente: json["id_cliente"],
        idUsuario: json["id_usuario"],
        fechaPagoDetalleCc: DateTime.parse(json["fecha_pago_detalle_cc"]),
        dniCliente: json["dni_cliente"],
        nombreCliente: json["nombre_cliente"],
        apellidoCliente: json["apellido_cliente"],
        telefonoCliente: json["telefono_cliente"],
        direccionCliente: json["direccion_cliente"],
        fechaAltaCliente: DateTime.parse(json["fecha_alta_cliente"]),
        estadoCliente: json["estado_cliente"],
    );

    Map<String, dynamic> toMap() => {
        "id_detalle_cc": idDetalleCc,
        "id_cuenta_corriente": idCuentaCorriente,
        "id_ventas": idVentas,
        "fecha_detalle_cc": fechaDetalleCc.toIso8601String(),
        "monto_detalle_cc": montoDetalleCc,
        "estado_detalle_cc": estadoDetalleCc,
        "id_cliente": idCliente,
        "id_usuario": idUsuario,
        "fecha_pago_detalle_cc": fechaPagoDetalleCc.toIso8601String(),
        "dni_cliente": dniCliente,
        "nombre_cliente": nombreCliente,
        "apellido_cliente": apellidoCliente,
        "telefono_cliente": telefonoCliente,
        "direccion_cliente": direccionCliente,
        "fecha_alta_cliente": "${fechaAltaCliente.year.toString().padLeft(4, '0')}-${fechaAltaCliente.month.toString().padLeft(2, '0')}-${fechaAltaCliente.day.toString().padLeft(2, '0')}",
        "estado_cliente": estadoCliente,
    };
}
*/