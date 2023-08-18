import 'package:flutter/material.dart';
import 'package:industria/cuentas/cuentas.dart';
import '../models/ventas/ventas.dart';
import '../compras/compras.dart';
import 'package:industria/proveedor/proveedor.dart';

class Menuop extends StatefulWidget {
  const Menuop({super.key});
  @override
  State<Menuop> createState() => _MenuopState();
}

class _MenuopState extends State<Menuop> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
           backgroundColor: Colors.amber[300],
           
          elevation: 0,
          title: Row(
            
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                 Container(
                  //margin: const EdgeInsets.only(bottom:20),
                 height: 115,
                 width: 115,
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                ),
              
            ],
          ),
         
         
        ),
        
        backgroundColor: Colors.amber[300],
        body: GridView.count(crossAxisCount: 2,
        children: [
          muestra(
            child:TextButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (contex)=>ventas_nombre()));
            }, child:Image.asset("assets/ventas.png",width: 100)
             ),
             text: "Ventas",
          ),
          muestra(
            child:TextButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (_)=>cuentas()));
            }, child:Image.asset("assets/cuentas.png",width: 100)
             ),
             text: "Cuentas Corrientes",
          ),
           muestra(
            child:TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>compra()));
            },
             child:Image.asset("assets/compras.png",width: 100)
             ),
             text: "Compras",
          ),
          /*
          muestra(
            child:TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>proveedor()));
            },
             child:Image.asset("assets/proveeedor.png",width: 100)
             ),
             text: "Proveedores",
          ),
          */
        ],) ,
      ),
    );
  }
}

class muestra extends StatelessWidget {
final Widget child;
final String text;

  const muestra({
    required this.child,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10)),

      child: Card(
          margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              this.child,
               SizedBox(height: 5,),
               Text(this.text, textAlign: TextAlign.center,
               style: TextStyle(fontSize: 14),)
            ],
          ),
                  ),
        ),
      ),
    );
  }
}