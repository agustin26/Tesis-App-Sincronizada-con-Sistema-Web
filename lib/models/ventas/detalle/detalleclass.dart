// To parse this JSON data, do
//
//     final detalleventa = detalleventaFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Detalleventa> detalleventaFromJson(String str) => List<Detalleventa>.from(json.decode(str).map((x) => Detalleventa.fromJson(x)));

String detalleventaToJson(List<Detalleventa> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Detalleventa {
    String idDetalleVentas;
    String numeroVenta;
    String dniCliente;
    String idProducto;
    String nombreProducto;
    String precioVentaProducto;
    String cantidadDetalleV;
    String descuentoDetalleV;
    String importeDetalleV;
    DateTime fechaDetalleV;
    String idUsuario;
    String idCliente;
    String estadoDetalleV;

    Detalleventa({
        required this.idDetalleVentas,
        required this.numeroVenta,
        required this.dniCliente,
        required this.idProducto,
        required this.nombreProducto,
        required this.precioVentaProducto,
        required this.cantidadDetalleV,
        required this.descuentoDetalleV,
        required this.importeDetalleV,
        required this.fechaDetalleV,
        required this.idUsuario,
        required this.idCliente,
        required this.estadoDetalleV,
    });

    factory Detalleventa.fromJson(Map<String, dynamic> json) => Detalleventa(
        idDetalleVentas: json["id_detalle_ventas"],
        numeroVenta: json["numero_venta"],
        dniCliente: json["dni_cliente"],
        idProducto: json["id_producto"],
        nombreProducto: json["nombre_producto"],
        precioVentaProducto: json["precio_venta_producto"],
        cantidadDetalleV: json["cantidad_detalle_v"],
        descuentoDetalleV: json["descuento_detalle_v"],
        importeDetalleV: json["importe_detalle_v"],
        fechaDetalleV: DateTime.parse(json["fecha_detalle_v"]),
        idUsuario: json["id_usuario"],
        idCliente: json["id_cliente"],
        estadoDetalleV: json["estado_detalle_v"],
    );

    Map<String, dynamic> toMap() => {
        "id_detalle_ventas": idDetalleVentas,
        "numero_venta": numeroVenta,
        "dni_cliente": dniCliente,
        "id_producto": idProducto,
        "nombre_producto": nombreProducto,
        "precio_venta_producto": precioVentaProducto,
        "cantidad_detalle_v": cantidadDetalleV,
        "descuento_detalle_v": descuentoDetalleV,
        "importe_detalle_v": importeDetalleV,
        "fecha_detalle_v": "${fechaDetalleV.year.toString().padLeft(4, '0')}-${fechaDetalleV.month.toString().padLeft(2, '0')}-${fechaDetalleV.day.toString().padLeft(2, '0')}",
        "id_usuario": idUsuario,
        "id_cliente": idCliente,
        "estado_detalle_v": estadoDetalleV,
    };
}
