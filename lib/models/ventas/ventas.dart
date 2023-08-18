import 'package:flutter/material.dart';
import 'busqueda.dart';
import 'ventasclass.dart';
import 'api_service_con.dart';
import 'detalle/detallev.dart';

class ventas_nombre extends StatefulWidget {
  const ventas_nombre({super.key});

  @override
  State<ventas_nombre> createState() => _ventas_nombreState();
}

class _ventas_nombreState extends State<ventas_nombre> {
  FetchVentas _registros = FetchVentas();

  @override
  Widget build(BuildContext context) {

String numero_venta='';

    return Scaffold(
        appBar: AppBar(
            elevation: 15,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Ventas'),
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
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchVentas(),);
              },
              icon: Icon(Icons.search_sharp),
            )
          ],
        ),
        body:/* ListView(
          children:[ Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:*/ Container(
                  child: FutureBuilder<List<Ventas>>(
                    future: _registros.getVentasList(),
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
                                     // _mostrarAlert(context,data,index);
                                     //detalle
                                     numero_venta='${data?[index].numeroVenta}';
                                     Navigator.push(context, MaterialPageRoute(builder: (_)=>detallev(numero_venta)));
                                    
                                    }, child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Fecha Venta: ${data?[index].fechaVenta.day}/${data?[index].fechaVenta.month}/${data?[index].fechaVenta.year}',
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.redAccent),
                                        ),
                                         Text(
                                          'Numero de Venta: ${data?[index].numeroVenta}',
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.redAccent),
                                        ),
                                        Text(
                                      'Cliente: ${data?[index].nombreCliente}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54,
                                          ),
                                    ),
                                    Text(
                                      'D.N.I Cliente: ${data?[index].dniCliente}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54),
                                    ),
                                    Text(
                                      'Vendedor: ${data?[index].usuario}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54),
                                    ),
                                    Text(
                                      'Tipo Pago: ${data?[index].tipoPagoVenta}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54),
                                    ),
                                      Text(
                                      'Total: \$${data?[index].totalVenta}',
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
          //),
     //   ]),
     // ),
    );
  }
}

/*
void _mostrarAlert (BuildContext context,data,index){
  showDialog(builder: (context) => AlertDialog(
    title: Text("DETALLE DE VENTA",style: TextStyle(
                                              fontSize: 20, backgroundColor: Colors.amber[100] ),),
    content: Text("Cliente: ${data?[index].clienteVenta} \n D.N.I Cliente: ${data?[index].dniClienteVenta} \n Fecha Venta: ${data?[index].fechaVenta} \n Cantidad:  ${data?[index].cantidadDetalleV} \n Producto: ${data?[index].productoDetalleV} \n Precio Venta: \$${data?[index].precioDetalleV} \n Descuento(%): ${data?[index].descuentoDetalleV} \n Importe: \$${data?[index].importeDetalleV} "),
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