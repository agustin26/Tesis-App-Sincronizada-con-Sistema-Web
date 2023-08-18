import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'cuentasclass.dart';

class FetchCuentas {
  var data = [];
  List<Cuentas> results = [];
  //String fetchurl = "http://localhost/prueba/allCuentas.php";
  String fetchurl = "https://tesisagus.000webhostapp.com/allcuentas.php";

  Future<List<Cuentas>>getCuentasList({String? query} ) async {
    var url = Uri.parse(fetchurl);
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => Cuentas.fromJson(e)).toList();
        if(query!=null){
          // results=results.where((element) => element.cliente.toLowerCase().contains(query.toLowerCase())).toList();
       //esto es para la busqueda, se filtra segun estos valores
          results = results.where( (element) {
            if ( element.apellidoCliente.toLowerCase().contains(query.toLowerCase())) {
              return true;
            } else if (element.nombreCliente.toLowerCase().contains(query.toLowerCase())) {
              return true;
            }else if (element.dniCliente.toLowerCase().contains(query.toLowerCase())) {
              return true;
            }  else {
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


  /********************************** 
   * tengo que crear una copia del search.dart con otro nombre
   * una copia del main pero para que abra una nueva pestaña
   * agregar en el main principal algo cree la pestaña y dirija hacia ella
  */
  /*
  Future<List<Ventas>>getVentas_mes_List({String? query} ) async {
    var url = Uri.parse(fetchurl);
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => Ventas.fromJson(e)).toList();
        if(query!=null){
          results=results.where((element) => element.fechaVenta.month.toString().contains(query.toLowerCase())).toList();
        }
      } else {
        print("api error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }*/
}
