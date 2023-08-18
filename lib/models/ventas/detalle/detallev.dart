import 'package:flutter/material.dart';
import 'detalleclass.dart';
import 'detallev_api_con.dart';
import 'dart:convert';

class detallev extends StatefulWidget {
  final String texto;
  const detallev(this.texto,{super.key});

  @override
  State<detallev> createState() => _detallevState();
}

class _detallevState extends State<detallev> {
  FetchDetalle _registros = FetchDetalle();
 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
            elevation: 15,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Detalle de Venta'),
              Container(
//margin: const EdgeInsets.only(right: 155),
                child: Image.asset(
                  'assets/ventas.png',
                  fit: BoxFit.cover,
                  height: 52,
                ),
              ),
            ],
          ),
         
        ),
        body: /*ListView(
          children:[ */SingleChildScrollView(
            child: Column(
              children: [
              /*  Card(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      
                                      TextButton(onPressed: (){
                                            //PONER ALERT DIALOG
                                        //_mostrarAlert(context,data,index);
                  
                                      }, child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                        Text(
                                        'Nu.Venta',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.yellow[800]),
                                      ),
                                      Text(
                                        "\t\t\t  \t\t  \t     Productos",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.yellow[800]),
                                      ),
                                      Text(
                                        "                Cantidad",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.yellow[800]),
                                            
                                      ),
                                      Text(
                                        'Descuento%',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.yellow[800]),
                                            
                                      ),
                                        Text(
                                        'Importes',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.yellow[800]),
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
                                ),
                    */          
                
                
                /*Padding(
                  padding: const EdgeInsets.all(5.0),
                  child:*/ Container(
                    child: FutureBuilder<List<Detalleventa>>(
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
                                        'Numero de Venta: ${data?[index].numeroVenta}',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.yellow[800]),
                                            textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Producto: ${data?[index].nombreProducto}',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black54),
                                           
                                      ),
                                      Text(
                                        'Cantidad: ${data?[index].cantidadDetalleV}',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black54),
                                            
                                      ),
                                      Text(
                                        'Descuento%: ${data?[index].descuentoDetalleV}',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black54),
                                            
                                      ),
                                        Text(
                                        'Importe: \$${data?[index].importeDetalleV}',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.green),
                                        )
                                      
                                        
                                   
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
              //],
            ]),
          ),
       // ]),
      
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