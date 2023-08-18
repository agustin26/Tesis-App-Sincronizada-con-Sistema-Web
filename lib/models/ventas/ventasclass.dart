// To parse this JSON data, do
//
//     final ventas = ventasFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Ventas> ventasFromJson(String str) => List<Ventas>.from(json.decode(str).map((x) => Ventas.fromJson(x)));

String ventasToJson(List<Ventas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Ventas {
    String idVentas;
    DateTime fechaVenta;
    String numeroVenta;
    String nombreCliente;
    String dniCliente;
    String usuario;
    String totalVenta;
    String tipoPagoVenta;
    String estadoVenta;
    String idUsuario;
    String idCliente;

    Ventas({
        required this.idVentas,
        required this.fechaVenta,
        required this.numeroVenta,
        required this.nombreCliente,
        required this.dniCliente,
        required this.usuario,
        required this.totalVenta,
        required this.tipoPagoVenta,
        required this.estadoVenta,
        required this.idUsuario,
        required this.idCliente,
    });

    factory Ventas.fromJson(Map<String, dynamic> json) => Ventas(
        idVentas: json["id_ventas"],
        fechaVenta: DateTime.parse(json["fecha_venta"]),
        numeroVenta: json["numero_venta"],
        nombreCliente: json["nombre_cliente"],
        dniCliente: json["dni_cliente"],
        usuario: json["usuario"],
        totalVenta: json["total_venta"],
        tipoPagoVenta: json["tipo_pago_venta"],
        estadoVenta: json["estado_venta"],
        idUsuario: json["id_usuario"],
        idCliente: json["id_cliente"],
    );

    Map<String, dynamic> toMap() => {
        "id_ventas": idVentas,
        "fecha_venta": "${fechaVenta.year.toString().padLeft(4, '0')}-${fechaVenta.month.toString().padLeft(2, '0')}-${fechaVenta.day.toString().padLeft(2, '0')}",
        "numero_venta": numeroVenta,
        "nombre_cliente": nombreCliente,
        "dni_cliente": dniCliente,
        "usuario": usuario,
        "total_venta": totalVenta,
        "tipo_pago_venta": tipoPagoVenta,
        "estado_venta": estadoVenta,
        "id_usuario": idUsuario,
        "id_cliente": idCliente,
    };
}


// To parse this JSON data, do
//
//     final ventas = ventasFromJson(jsonString);
/*
import 'dart:convert';

List<Ventas> ventasFromJson(String str) => List<Ventas>.from(json.decode(str).map((x) => Ventas.fromJson(x)));

String ventasToJson(List<Ventas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Ventas {
    String idVentas;
    DateTime fechaVenta;
    String numeroVenta;
    String clienteVenta;
    String dniClienteVenta;
    String vendedor;
    String totalVenta;
    String tipoPagoVenta;
    String estadoVenta;
    String idUsuario;
    String idCliente;

    Ventas({
        required this.idVentas,
        required this.fechaVenta,
        required this.numeroVenta,
        required this.clienteVenta,
        required this.dniClienteVenta,
        required this.vendedor,
        required this.totalVenta,
        required this.tipoPagoVenta,
        required this.estadoVenta,
        required this.idUsuario,
        required this.idCliente,
    });

    factory Ventas.fromJson(Map<String, dynamic> json) => Ventas(
        idVentas: json["id_ventas"],
        fechaVenta: DateTime.parse(json["fecha_venta"]),
        numeroVenta: json["numero_venta"],
        clienteVenta: json["cliente_venta"],
        dniClienteVenta: json["dni_cliente_venta"],
        vendedor: json["vendedor"],
        totalVenta: json["total_venta"],
        tipoPagoVenta: json["tipo_pago_venta"],
        estadoVenta: json["estado_venta"],
        idUsuario: json["id_usuario"],
        idCliente: json["id_cliente"],
    );

    Map<String, dynamic> toMap() => {
        "id_ventas": idVentas,
        "fecha_venta": "${fechaVenta.year.toString().padLeft(4, '0')}-${fechaVenta.month.toString().padLeft(2, '0')}-${fechaVenta.day.toString().padLeft(2, '0')}",
        "numero_venta": numeroVenta,
        "cliente_venta": clienteVenta,
        "dni_cliente_venta": dniClienteVenta,
        "vendedor": vendedor,
        "total_venta": totalVenta,
        "tipo_pago_venta": tipoPagoVenta,
        "estado_venta": estadoVenta,
        "id_usuario": idUsuario,
        "id_cliente": idCliente,
    };
}
*/