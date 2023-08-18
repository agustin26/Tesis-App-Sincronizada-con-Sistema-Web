import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'detallecuenta_class.dart';

class FetchDetallecuenta {
  var data = [];
    List<Detallecuentas> results = [];
  //String fetchurl = 'http://localhost/prueba/detallecuenta.php?id_cuenta_corriente=';
  String fetchurl = "https://tesisagus.000webhostapp.com/detallecuenta.php?id_cuenta_corriente=";
  Future<List<Detallecuentas>>getDetalleList(String param, {String? query} ) async {

    final rparam=param.trim();
  
    http.Response response= await http.get(Uri.parse(fetchurl+rparam));
    try {
      if (response.statusCode == 200) {
        data = json.decode(response.body);
       
       results = data.map((e) => Detallecuentas.fromJson(e)).toList();
        

       
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
