import 'package:flutter/material.dart';
import 'cuentasclass.dart';
import 'api_service.dart';
import 'detallecuenta/detallecuenta.dart';


class SearcCuentas extends SearchDelegate{
 
 

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

FetchCuentas _compraslist = FetchCuentas();
//RESULTADOS
  @override
  Widget buildResults(BuildContext context) {
    String id_cuenta_corriente="";
    String estado="";

    return Container(
            child: FutureBuilder<List<Cuentas>>(
              future: _compraslist.getCuentasList(query: query),
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
                                      'ID del Cliente: ${data?[index].idCliente}',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54,
                                          ),
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
    String estado="";
     return  Container(
            child: FutureBuilder<List<Cuentas>>(
              future: _compraslist.getCuentasList(query: query),
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
                              Text('Cliente: ${data?[index].apellidoCliente} ${data?[index].nombreCliente}', style: TextStyle(fontSize: 20, color: Colors.redAccent),),
                              Text('D.N.I Cliente: ${data?[index].dniCliente}', style: TextStyle(fontSize: 15, color: Colors.black54),),
                              Text('Estado de Cuenta: $estado', style: TextStyle(fontSize: 15, color: Colors.black),),
                            
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

