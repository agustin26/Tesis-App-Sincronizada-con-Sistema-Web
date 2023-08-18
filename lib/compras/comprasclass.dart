// To parse this JSON data, do
//
//     final compras = comprasFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Compras> comprasFromJson(String str) => List<Compras>.from(json.decode(str).map((x) => Compras.fromJson(x)));

String comprasToJson(List<Compras> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Compras {
    String idCompras;
    DateTime fechaCompra;
    String numeroCompra;
    String nombreProveedor;
    String cuitProveedor;
    String usuario;
    String totalCompra;
    String tipoPagoCompra;
    String estadoCompra;
    String idUsuario;
    String idProveedor;

    Compras({
        required this.idCompras,
        required this.fechaCompra,
        required this.numeroCompra,
        required this.nombreProveedor,
        required this.cuitProveedor,
        required this.usuario,
        required this.totalCompra,
        required this.tipoPagoCompra,
        required this.estadoCompra,
        required this.idUsuario,
        required this.idProveedor,
    });

    factory Compras.fromJson(Map<String, dynamic> json) => Compras(
        idCompras: json["id_compras"],
        fechaCompra: DateTime.parse(json["fecha_compra"]),
        numeroCompra: json["numero_compra"],
        nombreProveedor: json["nombre_proveedor"],
        cuitProveedor: json["cuit_proveedor"],
        usuario: json["usuario"],
        totalCompra: json["total_compra"],
        tipoPagoCompra: json["tipo_pago_compra"],
        estadoCompra: json["estado_compra"],
        idUsuario: json["id_usuario"],
        idProveedor: json["id_proveedor"],
    );

    Map<String, dynamic> toMap() => {
        "id_compras": idCompras,
        "fecha_compra": "${fechaCompra.year.toString().padLeft(4, '0')}-${fechaCompra.month.toString().padLeft(2, '0')}-${fechaCompra.day.toString().padLeft(2, '0')}",
        "numero_compra": numeroCompra,
        "nombre_proveedor": nombreProveedor,
        "cuit_proveedor": cuitProveedor,
        "usuario": usuario,
        "total_compra": totalCompra,
        "tipo_pago_compra": tipoPagoCompra,
        "estado_compra": estadoCompra,
        "id_usuario": idUsuario,
        "id_proveedor": idProveedor,
    };
}
