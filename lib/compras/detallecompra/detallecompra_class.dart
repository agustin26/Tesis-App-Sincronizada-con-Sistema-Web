// To parse this JSON data, do
//
//     final detallecompra = detallecompraFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Detallecompra> detallecompraFromJson(String str) => List<Detallecompra>.from(json.decode(str).map((x) => Detallecompra.fromJson(x)));

String detallecompraToJson(List<Detallecompra> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Detallecompra {
    String idDetalleCompras;
    String numeroCompra;
    String cuitProveedor;
    String idProducto;
    String nombreProducto;
    String precioCompraDc;
    String cantidadCompraDc;
    String descuentoDc;
    String importeDc;
    DateTime fechaCompraDc;
    String idUsuario;
    String idProveedor;
    String estadoDc;
    String idCategoria;

    Detallecompra({
        required this.idDetalleCompras,
        required this.numeroCompra,
        required this.cuitProveedor,
        required this.idProducto,
        required this.nombreProducto,
        required this.precioCompraDc,
        required this.cantidadCompraDc,
        required this.descuentoDc,
        required this.importeDc,
        required this.fechaCompraDc,
        required this.idUsuario,
        required this.idProveedor,
        required this.estadoDc,
        required this.idCategoria,
    });

    factory Detallecompra.fromJson(Map<String, dynamic> json) => Detallecompra(
        idDetalleCompras: json["id_detalle_compras"],
        numeroCompra: json["numero_compra"],
        cuitProveedor: json["cuit_proveedor"],
        idProducto: json["id_producto"],
        nombreProducto: json["nombre_producto"],
        precioCompraDc: json["precio_compra_dc"],
        cantidadCompraDc: json["cantidad_compra_dc"],
        descuentoDc: json["descuento_dc"],
        importeDc: json["importe_dc"],
        fechaCompraDc: DateTime.parse(json["fecha_compra_dc"]),
        idUsuario: json["id_usuario"],
        idProveedor: json["id_proveedor"],
        estadoDc: json["estado_dc"],
        idCategoria: json["id_categoria"],
    );

    Map<String, dynamic> toMap() => {
        "id_detalle_compras": idDetalleCompras,
        "numero_compra": numeroCompra,
        "cuit_proveedor": cuitProveedor,
        "id_producto": idProducto,
        "nombre_producto": nombreProducto,
        "precio_compra_dc": precioCompraDc,
        "cantidad_compra_dc": cantidadCompraDc,
        "descuento_dc": descuentoDc,
        "importe_dc": importeDc,
        "fecha_compra_dc": "${fechaCompraDc.year.toString().padLeft(4, '0')}-${fechaCompraDc.month.toString().padLeft(2, '0')}-${fechaCompraDc.day.toString().padLeft(2, '0')}",
        "id_usuario": idUsuario,
        "id_proveedor": idProveedor,
        "estado_dc": estadoDc,
        "id_categoria": idCategoria,
    };
}
