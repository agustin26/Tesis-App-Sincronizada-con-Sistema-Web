import 'package:flutter/material.dart';
import 'ventasclass.dart';
import 'api_service_con.dart';
import 'detalle/detallev.dart';

class SearchVentas extends SearchDelegate{
 
 

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

FetchVentas _ventaslist = FetchVentas();

//RESULTADOS
  @override
  Widget buildResults(BuildContext context) {
    String numero_venta='';

    return Container(
            child: FutureBuilder<List<Ventas>>(
              future: _ventaslist.getVentasList(query: query),
              // future: _ventaslist.getVentas_mes_List(query: query),
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
                  
                  //return CircularProgressIndicator();
                },
               
              ),
            );


  }
//SUGERENCIAS
  @override
  Widget buildSuggestions(BuildContext context) {
    
     return  Container(
            child: FutureBuilder<List<Ventas>>(
              future: _ventaslist.getVentasList(query: query),
              // future: _ventaslist.getVentas_mes_List(query: query),
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
                              Text('Fecha Venta: ${data?[index].fechaVenta.day}/${data?[index].fechaVenta.month}/${data?[index].fechaVenta.year}', style: TextStyle(fontSize: 20, color: Colors.redAccent),),
                              Text('Cliente: ${data?[index].nombreCliente}', style: TextStyle(fontSize: 15, color: Colors.black54),),
                              Text('Forma de Pago: ${data?[index].tipoPagoVenta}', style: TextStyle(fontSize: 15, color: Colors.black),),
                            
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

