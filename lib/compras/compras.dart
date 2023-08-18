import 'package:flutter/material.dart';
import 'busqueda_compras.dart';
import 'comprasclass.dart';
import 'api_service.dart';
import'detallecompra/detallecompra.dart';
class compra extends StatefulWidget {
  const compra({super.key});

  @override
  State<compra> createState() => _compraState();
}

class _compraState extends State<compra> {
  FetchCompras _registros = FetchCompras();

  @override
  Widget build(BuildContext context) {

    String numero_compra='';

    return  Scaffold(
        appBar: AppBar(
          elevation: 15,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Compras'),
              Container(
                //margin: const EdgeInsets.only(right: 155),
                child: Image.asset(
                  'assets/compras.png',
                  fit: BoxFit.cover,
                  height: 62,
                ),
              ),
            ],
          ),
          /* title: Text('Compras'),
          elevation: 15,
          leading: Container(child:
            Image.asset('assets/compras.png')
          ),*/
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearcCompras(),
                );
              },
              icon: Icon(Icons.search_sharp),
            )
          ],
        ),
        body:/* ListView(
                 children:[ Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child:*/ Container(
                          child: FutureBuilder<List<Compras>>(
                            future: _registros.getComprasList(),
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
                                          TextButton(
                                            onPressed: () {
                                              // PONER ALERT DIALOG
                                             // _mostrarAlert(context, data, index);
                        
                                             numero_compra='${data?[index].numeroCompra}';
                                             Navigator.push(context, MaterialPageRoute(builder: (_)=>detallecompra(numero_compra)));
                                            
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Fecha Compra: ${data?[index].fechaCompra.day}/${data?[index].fechaCompra.month}/${data?[index].fechaCompra.year}',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.redAccent),
                                                ),
                                                Text(
                                                  'Numero de Compra: ${data?[index].numeroCompra}',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                        
                                                Text(
                                                  'Proveedor: ${data?[index].nombreProveedor}',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                                Text(
                                                  'C.U.I.T proveedor: ${data?[index].cuitProveedor}',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black54),
                                                ),
                                                Text(
                                                  'Comprador: ${data?[index].usuario}',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black54),
                                                ),
                                                Text(
                                                  'Tipo Pago: ${data?[index].tipoPagoCompra}',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black54),
                                                ),
                                                Text(
                                                  'Total: \$${data?[index].totalCompra}',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black54),
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
                   // ],
                  //),
              //]),
             
          
          
      
      );
  }
}

/*
void _mostrarAlert(BuildContext context, data, index) {
  showDialog(
    builder: (context) => AlertDialog(
      title: Text(
        "DETALLE DE COMPRA",
        style: TextStyle(fontSize: 20, backgroundColor: Colors.amber[100]),
      ),
      content: Text(
          "Proveedor: ${data?[index].nombreProveedorCompra} \n C.U.I.T Proveedor: ${data?[index].cuitProveedorDc} \n Fecha Compra: ${data?[index].fechaCompra} \n Cantidad:  ${data?[index].cantidadCompraDc} \n Producto: ${data?[index].productoDc} \n Precio Compra: \$${data?[index].precioCompraDc} \n Descuento(%): ${data?[index].descuentoDc} \n Importe: \$${data?[index].importeDc} ",
          style: TextStyle(fontSize: 16)),
    ),
    context: context,
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