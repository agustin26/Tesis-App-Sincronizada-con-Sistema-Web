import 'package:flutter/material.dart';
import 'detallecuenta_class.dart';
import 'detallecuenta_api_con.dart';
import 'dart:convert';

class detallecuenta extends StatefulWidget {
  final String texto;
  const detallecuenta(this.texto,{super.key});

  @override
  State<detallecuenta> createState() => _detallecuentaState();
}

class _detallecuentaState extends State<detallecuenta> {
  FetchDetallecuenta _registros = FetchDetallecuenta();
 String movimiento='';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
            elevation: 15,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Detalle de Cuenta'),
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
                child: */ SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(children: [
                
                      ],),
                      Container(
                        child: FutureBuilder<List<Detallecuentas>>(
                          future: _registros.getDetalleList(widget.texto),
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
                                   // movimiento='${data?[index].tipoMovimientoDetalleCc}';
                                    
                                 

                                     if('${data?[index].tipoMovimientoDetalleCc}'=='f')
                                               {
                                                  movimiento="Factura";
                                               };
                                               if('${data?[index].tipoMovimientoDetalleCc}'=='p'){
                                                  movimiento='Pago';
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
                                            'Cliente: ${data?[index].apellidoCliente} ${data?[index].nombreCliente}',
                                            style: TextStyle(
                                                fontSize: 15, color: Colors.green),
                                          ),
                
                                          Text(
                                            'Fecha: ${data?[index].fechaDetalleCc.day}/${data?[index].fechaDetalleCc.month}/${data?[index].fechaDetalleCc.year}',
                                            style: TextStyle(
                                                fontSize: 15, color: Colors.green),
                                          ),
                                          
                                           Text(
                                            'Monto: \$${data?[index].montoDetalleCc}',
                                            style: TextStyle(
                                                fontSize: 15, color: Colors.red),
                                          ),
                                          Text(
                                            'Descripcion: ${data?[index].descripcionDetalleCc}',
                                            style: TextStyle(
                                                fontSize: 15, color: Colors.black54),
                                          ),
                                           Text(
                                            'Tipo de Movimiento: $movimiento',
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
                            
                           
  
                            return Container(
                                child: Center(
                              child: CircularProgressIndicator(),
                            )
                            );
                          },
                         ),     
                      ),


                    
  
                      Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        TextButton(onPressed: (){},
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                           "Esto es todo por ahora...",
                                            style: TextStyle(
                                                fontSize: 15, color: Colors.black54),
                                                textAlign: TextAlign.center,
                                          ),
                         ],)
                         )
                      ],
                    )
                  )

                    ],
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