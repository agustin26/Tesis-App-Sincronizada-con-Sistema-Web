import 'package:flutter/material.dart';
import 'proveedor_class.dart';
import 'proveedor_api_con.dart';
import 'dart:convert';

class proveedor extends StatefulWidget {

  @override
  State<proveedor> createState() => _proveedorState();
}

class _proveedorState extends State<proveedor> {
  FetchProveedor _registros = FetchProveedor();
 String estado="";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            elevation: 15,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Proveedores'),
              Container(
//margin: const EdgeInsets.only(right: 155),
                child: Image.asset(
                  'assets/proveeedor.png',
                  fit: BoxFit.cover,
                  height: 52,
                ),
              ),
            ],
          ),
         
        ),
        body: /*ListView(
          children:[*/ 
/*
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text('Fecha Detalle ',style: TextStyle(fontSize: 20, color: Colors.yellow[800],fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
             ),
              Text("Estado  ",style: TextStyle(fontSize: 20, color: Colors.yellow[800],fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
             ),
             Text("Fecha Pago ",style: TextStyle(fontSize: 20, color: Colors.yellow[800],fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
             ),
              ],),*/
              
             /* Padding(
                padding: const EdgeInsets.all(8.0),
                child: */ Container(
                  child: FutureBuilder<List<Proveedor>>(
                    future: _registros.getProveedorList(),
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
                               if('${data?[index].estadoProveedor}'=='1')
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
                                      //_mostrarAlert(context,data,index);
        
                                    }, child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                     
                                    Text(
                                      'C.I.I.T Proveedor: ${data?[index].cuitProveedor}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.redAccent),
                                    ),
                                     Text(
                                      'Nombre del Proveedor: ${data?[index].nombreProveedor}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.red),
                                    ),
                                    Text(
                                      'Direccion: ${data?[index].direccionProveedor}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54),
                                    ),
                                     Text(
                                      'Correo: ${data?[index].correoProveedor}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54),
                                    ),
                                     Text(
                                      'Telefono: ${data?[index].telefonoProveedor}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54),
                                    ),
                                     Text(
                                      'Estado: $estado',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.green),
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
             // ),
              
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
      
     ),
    );
  }
}


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