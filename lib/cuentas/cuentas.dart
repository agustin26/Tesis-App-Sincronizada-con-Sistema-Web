import 'package:flutter/material.dart';
import 'busqueda_cuentas.dart';
import 'cuentasclass.dart';
import 'api_service.dart';
import 'dart:convert';

import 'detallecuenta/detallecuenta.dart';

class cuentas extends StatefulWidget {
  const cuentas({super.key});

  @override
  State<cuentas> createState() => _cuentasState();
}

class _cuentasState extends State<cuentas> {
  FetchCuentas _registros = FetchCuentas();
  String estado="";
  @override
  Widget build(BuildContext context) {
    String id_cuenta_corriente='';
    return /* SafeArea(
      child: */ Scaffold(
        appBar: AppBar(
            elevation: 15,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Cuentas Corrientes'),
              Container(
//margin: const EdgeInsets.only(right: 155),
                child: Image.asset(
                  'assets/cuentas.png',
                  fit: BoxFit.cover,
                  height: 52,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearcCuentas(),);
              },
              icon: Icon(Icons.search_sharp),
            )
          ],
        ),
        body: /* ListView(
          children:[ Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: */ Container(
                  child: FutureBuilder<List<Cuentas>>(
                    future: _registros.getCuentasList(),
                    //future: _registros.getVentas_mes_List(),
                    builder: (context, snapshot) {
                      var data = snapshot.data;
                    
                      if (snapshot.hasData) {
                        return  ListView.builder(
                            //itemCount:data?.length,
                            itemCount: snapshot.data!.length,
                            shrinkWrap: true, //emboltorio
                            itemBuilder: (context, index) {
                              /*  if (!snapshot.hasData) {
                                   return Center(child: CircularProgressIndicator());
                                }*/
                              // Products product = snapshot.data![index];
                                if('${data?[index].estadoCc}'=='1')
                                         {
                                          estado="Activo";
                                         }else{
                                          estado='Inactivo';
                                         };
                                    
                              return Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  
                                    TextButton(onPressed: (){
                                          //PONER ALERT DIALOG
                                     // _mostrarAlert(context,data,index);
                                        id_cuenta_corriente='${data?[index].idCuentasCorrientes}';
                                     Navigator.push(context, MaterialPageRoute(builder: (_)=>detallecuenta(id_cuenta_corriente)));
                                    
                                    }, child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                       Text(
                                          'Cliente : ${data?[index].apellidoCliente}  ${data?[index].nombreCliente}',
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.redAccent),
                                        ),
                                         
                                        Text(
                                      'D.N.I del Cliente: ${data?[index].dniCliente}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54,
                                          ),
                                    ),
                                    Text(
                                      'Telefono: ${data?[index].telefonoCliente}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54,
                                          ),
                                    ),
                                    Text(
                                      'Direccion: ${data?[index].direccionCliente}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54,
                                          ),
                                    ),
                                     
                                    
                                    Text(
                                      'Estado de la cuenta: $estado',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54),
                                    ),

                                     Text(
                                      'Saldo:  \$${data?[index].saldoCc}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54),
                                    ),
                                    

                                        
                                    
                              
                                 
                                      ],
                                    ),
                                    
                        
                                    ),
                                   
                                    /*
                                      Text('${product.productName}', style: TextStyle(fontSize: 20, color: Colors.redAccent),),
                                      Text('${product.productDescription}', style: TextStyle(fontSize: 15, color: Colors.black54),),
                                      Text('${product.productPrice}', style: TextStyle(fontSize: 15, color: Colors.black),),
                                    */
                                 
                                  ],
                                ),
                              );
                            },
                          );
            
                      }
                     
                      return Center(
                          child: Center(
                        child: CircularProgressIndicator(),
                      )
                      );
                    },
                   ),     
                ),
            //  ),
              
              /* Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const Text('Mes'),
                  const SizedBox(width: 16),
                 
                  FloatingActionButton(
                    onPressed: () {
                      // Add your onPressed code here!
                    },
                    child: const Icon(Icons.calendar_month),
                  ),
                ],
              ),*/
          //  ],
        //  ),
     //   ]),
     // ),
    );
  }
}

/*
void _mostrarAlert (BuildContext context,data,index){
  showDialog(builder: (context) => AlertDialog(
    title: Text("DETALLE DE CUENTA CORRIENTE",style: TextStyle(
                                              fontSize: 20, backgroundColor: Colors.amber[100] ),),
    content: Text("Cliente: ${data?[index].apellidoCliente} ${data?[index].nombreCliente}  \n D.N.I Cliente: ${data?[index].dniCliente}   \n Direccion del Cliente: ${data?[index].direccionCliente} \n Monto: \$${data?[index].montoDetalleCc} \n Estado de la C.C: ${data?[index].estadoDetalleCc} "),
  ), context: context ,
  );
}
*/

/*
void _mostrarAlert (BuildContext context,data,index){
  showDialog(builder: (context) => AlertDialog(
    title: Text("DETALLE DE VENTA",style: TextStyle(
     
                                              fontSize: 25 ),),
    content:Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text("CLIENTE: ",  style: TextStyle(fontSize: 25)),
         Text('${data?[index].clienteVenta}',
         style: TextStyle(fontSize: 20, color: Colors.black87), ),

         Text("D.N.I CLIENTE:  ",  style: TextStyle(fontSize:  25)),
         Text('${data?[index].dniClienteVenta}',
         style: TextStyle(fontSize: 20, color: Colors.black87), ),

          Text("Fecha Venta:  ",  style: TextStyle(fontSize:  25)),
         Text('${data?[index].fechaVenta}',
         style: TextStyle(fontSize: 20, color: Colors.black87), ),

          Text("Cantidad:  ",  style: TextStyle(fontSize:  25)),
         Text('${data?[index].cantidadDetalleV}',
         style: TextStyle(fontSize: 20, color: Colors.black87), ),

           Text("Producto:  ",  style: TextStyle(fontSize:  25)),
         Text('${data?[index].productoDetalleV}',
         style: TextStyle(fontSize: 20, color: Colors.black87), ),

          Text("Precio Venta:  ",  style: TextStyle(fontSize:  25)),
         Text('${data?[index].precioDetalleV}',
         style: TextStyle(fontSize: 20, color: Colors.black87), ),

         Text("Descuento(%):  ",  style: TextStyle(fontSize:  25)),
         Text('${data?[index].descuentoDetalleV}',
         style: TextStyle(fontSize: 20, color: Colors.black87), ),

         Text("Importe:  ",  style: TextStyle(fontSize:  25)),
         Text('\$${data?[index].importeDetalleV}',
         style: TextStyle(fontSize: 20, color: Colors.black87), ),

      ]),
    ) ,
  ), context: context ,
  );
}
*/