
/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'comprasclass.dart';

class FetchCompras {
  var data = [];
  List<Compras> results = [];
  //String fetchurl = "http://localhost/prueba/allcompras.php";

String fetchurl = " https://tesisagus.000webhostapp.com/allcompras.php";

  Future<List<Compras>>getComprasList({String? query} ) async {
    var url = Uri.parse(fetchurl);
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => Compras.fromJson(e)).toList();
        if(query!=null){
          // results=results.where((element) => element.cliente.toLowerCase().contains(query.toLowerCase())).toList();
       
          results = results.where( (element) {
            if ( element.nombreProveedorCompra.toLowerCase().contains(query.toLowerCase())) {
              return true;
            } else if ( element.fechaCompra.day.toString().toLowerCase().contains(query.toLowerCase())) {
              return true;
            } else {
              return false;
            }
          }).toList();

        }
      } else {
        print("api error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }


  
}

*/
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'comprasclass.dart';

class FetchCompras{
  var data = [];
  List<Compras> results = [];
  //String fetchurl = "http://localhost/prueba/allcompras.php";
  String fetchurl = "https://tesisagus.000webhostapp.com/allcompras.php";

  Future<List<Compras>>getComprasList({String? query} ) async {
    var url = Uri.parse(fetchurl);
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => Compras.fromJson(e)).toList();
        if(query!=null){
          // results=results.where((element) => element.cliente.toLowerCase().contains(query.toLowerCase())).toList();
       //esto es para la busqueda, se filtra segun estos valores
          results = results.where( (element) {
            if ( element.nombreProveedor.toLowerCase().contains(query.toLowerCase())) {
              return true;
            } else if ( element.fechaCompra.day.toString().toLowerCase().contains(query.toLowerCase())){
              return true;
            } else {
              return false;
            }
          }).toList();

        }
      } else {
        print("api error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }



}
