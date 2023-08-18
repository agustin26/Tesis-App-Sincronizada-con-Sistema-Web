import 'package:flutter/material.dart';
import 'detallecompra_class.dart';
import 'detallecompra_api_con.dart';
import 'dart:convert';

class detallecompra extends StatefulWidget {
  final String texto;
  const detallecompra(this.texto,{super.key});

  @override
  State<detallecompra> createState() => _detallecompraState();
}

class _detallecompraState extends State<detallecompra> {
  FetchDetallecompra _registros = FetchDetallecompra();
 
  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        appBar: AppBar(
            elevation: 15,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Detalle de Compra'),
              Container(
//margin: const EdgeInsets.only(right: 155),
                child: Image.asset(
                  'assets/compras.png',
                  fit: BoxFit.cover,
                  height: 52,
                ),
              ),
            ],
          ),
         
        ),
        body: /*ListView(
          children:[*/   SingleChildScrollView(
            child: Column(
                  
                 children: [

                 /* Card(
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
                                        'Nu.Compra',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.yellow[800]),
                                      ),
                                      Text(
                                        "     Proveedor",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.yellow[800]),
                                      ),
                                      Text(
                                        "            Productos",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.yellow[800]),
                                            
                                      ),
                                      Text(
                                        'Descuento%',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.yellow[800]),
                                            
                                      ),
                                      Text(
                                        'Precio',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.yellow[800]),
                                      ),
                                      Text(
                                        'Cantidad',
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
                  /* Row(
                     
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text('Nu.Compra',style: TextStyle(fontSize: 15, color: Colors.yellow[800],fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                   ),
                    Text('Proveedor',style: TextStyle(fontSize: 15, color: Colors.yellow[800],fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                   ),
                         Text('Productos',style: TextStyle(fontSize: 15, color: Colors.yellow[800],fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                   ),
                    Text("Descuento%",style: TextStyle(fontSize: 15, color: Colors.yellow[800],fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                   ),
                    Text('Precio',style: TextStyle(fontSize: 15, color: Colors.yellow[800],fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                   ),
                    Text("Cantidad",style: TextStyle(fontSize: 15, color: Colors.yellow[800],fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                   ),
                   Text("Importes",style: TextStyle(fontSize: 15, color: Colors.yellow[800],fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                   ),
                    ],),*/
                  
                    /*Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:*/Container(
                        
                            child: FutureBuilder<List<Detallecompra>>(
                              future: _registros.getDetalleList(widget.texto),
                              //future: _registros.getVentas_mes_List(),
                              builder: (context, snapshot) {
                                var data = snapshot.data;
                                if (snapshot.hasData) {
                                  return ListView.builder(
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
                                            'Numero de Compra: ${data?[index].numeroCompra}',
                                            style: TextStyle(
                                                fontSize: 15, color: Colors.orange),
                                          ),
                                         
                                          Text(
                                            'Producto: ${data?[index].nombreProducto}',
                                            style: TextStyle(
                                                fontSize: 15, color: Colors.black54),
                                          ),
                                           Text(
                                            'Descuento%: ${data?[index].descuentoDc}',
                                            style: TextStyle(
                                                fontSize: 15, color: Colors.black54),
                                                textAlign: TextAlign.center,
                                          ),
                                            Text(
                                            'Precio de Compra: \$${data?[index].precioCompraDc}',
                                            style: TextStyle(
                                                fontSize: 15, color: Colors.black54),
                                          ),
                                          Text(
                                            'Cantidad: ${data?[index].cantidadCompraDc}',
                                            style: TextStyle(
                                                fontSize: 15, color: Colors.black54),
                                          ),
              
                                          Text(
                                            'Importe: \$${data?[index].importeDc}',
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
                                ));
                              },
                            ),
                          ),
                  
                  ]),
          )
                     
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