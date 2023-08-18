import 'package:flutter/material.dart';
import 'comprasclass.dart';
import 'api_service.dart';
import 'detallecompra/detallecompra.dart';

class SearcCompras extends SearchDelegate{
 
 

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
            Navigator.pop(context);
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

FetchCompras _compraslist = FetchCompras();
//RESULTADOS
  @override
  Widget buildResults(BuildContext context) {

    String numero_compra="";
    return Container(
            child: FutureBuilder<List<Compras>>(
              future: _compraslist.getComprasList(query: query),
              // future: _compraslist.getVentas_mes_List(query: query),
                builder: (context, snapshot) {
                  var data=snapshot.data;
                 // if (snapshot.hasData) {
                    
                    return ListView.builder(
                      itemCount:data?.length,
                     // itemCount: snapshot.data!.length,
                      shrinkWrap: true, //emboltorio
                      itemBuilder: (context, index) {
                        if (!snapshot.hasData) {
                           return Center(child: CircularProgressIndicator());
                        }
                       // Products product = snapshot.data![index];
                        return Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    
                                    TextButton(onPressed: (){
                                          //PONER ALERT DIALOG
                                     // _mostrarAlert(context,data,index);
                                       numero_compra='${data?[index].numeroCompra}';
                                     Navigator.push(context, MaterialPageRoute(builder: (_)=>detallecompra(numero_compra)));
                                    
                                    }, child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Fecha Compra: ${data?[index].fechaCompra.day}/${data?[index].fechaCompra.month}/${data?[index].fechaCompra.year}',
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.redAccent),
                                        ),
                                        Text(
                                      'Proveedor: ${data?[index].nombreProveedor}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54,
                                          ),
                                    ),
                                    Text(
                                      'C.U.I.T proveedor: ${data?[index].cuitProveedor}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54),
                                    ),
                                    Text(
                                      'Comprador: ${data?[index].usuario}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54),
                                    ),
                                    Text(
                                      'Tipo Pago: ${data?[index].tipoPagoCompra}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54),
                                    ),
                                      Text(
                                      'Total: \$${data?[index].totalCompra}',
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
                  
                  //return CircularProgressIndicator();
                },
               
              ),
            );


  }
//SUGERENCIAS
  @override
  Widget buildSuggestions(BuildContext context) {
    
     return  Container(
            child: FutureBuilder<List<Compras>>(
              future: _compraslist.getComprasList(query: query),
              // future: _compraslist.getVentas_mes_List(query: query),
                builder: (context, snapshot) {
                  var data=snapshot.data;
                 // if (snapshot.hasData) {
                    
                    return ListView.builder(
                      itemCount:data?.length,
                     // itemCount: snapshot.data!.length,
                      shrinkWrap: true, //emboltorio
                      itemBuilder: (context, index) {
                        if (!snapshot.hasData) {
                           return Center(child: CircularProgressIndicator());
                        }
                       // Products product = snapshot.data![index];
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Fecha Compra: ${data?[index].fechaCompra.day}/${data?[index].fechaCompra.month}/${data?[index].fechaCompra.year}', style: TextStyle(fontSize: 20, color: Colors.redAccent),),
                              Text('Proveedor: ${data?[index].nombreProveedor}', style: TextStyle(fontSize: 15, color: Colors.black54),),
                              Text('Forma de Pago: ${data?[index].tipoPagoCompra}', style: TextStyle(fontSize: 15, color: Colors.black),),
                            
                              /*
                              Text('${product.productName}', style: TextStyle(fontSize: 20, color: Colors.redAccent),),
                              Text('${product.productDescription}', style: TextStyle(fontSize: 15, color: Colors.black54),),
                              Text('${product.productPrice}', style: TextStyle(fontSize: 15, color: Colors.black),),
                            */],
                          ),
                        );
                      },
                    );
                  
                  //return CircularProgressIndicator();
                },
               
              ),
            );

  }

}

