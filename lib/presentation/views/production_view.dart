import 'package:accordion/accordion.dart';
import 'package:countech_app/infrastructure/models/data.dart';
import 'package:countech_app/infrastructure/models/production.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ProductionView extends StatefulWidget {
  const ProductionView({super.key});

  @override
  State<ProductionView> createState() => _ProductionViewState();
}

class _ProductionViewState extends State<ProductionView> {
  List<Production>? production;
  List<Production>? filterItems;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final Dio dio = Dio();

    try {
      final response = await dio
          .get("https://backend-countech-1.onrender.com/api/produccion/mobile");

      // production = Production.fromJson(response.data);

      setState(() {
        production = List<Map<String, dynamic>>.from(response.data)
            .map((e) => Production.fromJson(e))
            .toList();
            filterItems = production;
      });
    } catch (e) {
      print(e);
    }
  }

    void searchItem(String text) {
    setState(() {
      filterItems = production!
          .where((i) => i.ordenTrabajo.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
  }

  String getEstadoText(bool estado, int cantidadAsignada) {
  if (cantidadAsignada == 0) {
    return 'Pendiente';
  } else if (!estado && cantidadAsignada > 0) {
    return 'En proceso';
  } else if (estado) {
    return 'Terminado';
  }
  return '';
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextField(
          decoration: InputDecoration(hintText: 'Buscar por orden de trabajo'),
          onChanged: searchItem,

        ),
      ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Center(
                child:
                 filterItems == null
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: filterItems?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  final data = filterItems![index];
                  return Container(
                    child: Accordion(
                      headerBackgroundColor: Colors.white,
                      headerBorderColor: Colors.grey,
                      headerBorderWidth: 1,
                      contentBorderColor: Colors.grey,
                      contentBorderWidth: 1,
                      paddingListTop: 0,
                      paddingListBottom: 0,
                      contentHorizontalPadding: 5,
                      rightIcon: Icon(Icons.keyboard_arrow_down_rounded, size: 33, color: Colors.black,),
                      headerPadding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
                      children: [
                        AccordionSection(
                            // leftIcon: Icon(Icons.circle_outlined, size: 20, color: Colors.black,),
                            header: Container(
                                height: MediaQuery.of(context).size.height * 0.1,
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                      Text(
                                          'Orden de trabajo: ${data.ordenTrabajo}',
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 17)),
                                      Text(
                                          'Cliente: ${data.cliente.nombreComercial}',
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 17)),
                                      Row(
                                        children: [
                                          Text(data.estado,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17)), 
                                          if (data.estado == 'En proceso')
                                            Icon(Icons.hourglass_empty,
                                                color: Colors.blue, size: 20,),
                                          if (data.estado == 'Registrado')
                                            Icon(Icons.warning, color: Colors.orange, size: 20,)
                                        ],
                                      ),
                                        ]
                                      
                                      )
                                      
                                    ],
                                  ),
                                )),
                            content: Container(
                                child: Container(
                                    child: Column(
                              children: [
                                Container(
                                  
                                    child:
                                    
                                        Text('Referencia: ${data.referencia}', 
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17))),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(),
                                Container(
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemCount:
                                        data.procesoEnReferenciaEnPedidos.length,
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            Divider(),
                                    itemBuilder: (context, index) {
                                      final proceso = data
                                          .procesoEnReferenciaEnPedidos[index];
                                      return Container(
                                          child: ListTile(
                                        title: Text(proceso.proceso,                   
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17),
                                        ),
                                        subtitle: Row(
                                          children: [
                                            Text(getEstadoText(proceso.estado, proceso.cantidadAsignada),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16)),
                                            if (proceso.estado == false &&
                                                proceso.cantidadAsignada > 0)
                                              Icon(Icons.hourglass_empty,
                                                  color: Colors.blue, size: 20),
                                            if (proceso.cantidadAsignada == 0)
                                              Icon(Icons.warning,
                                                  color: Colors.orange, size: 20),
                                            if (proceso.estado == true)
                                              Icon(Icons.check_circle,
                                                  color: Colors.green, size: 20),
                                          ],
                                        ),
                                        trailing: IconButton(
                                          icon: Icon(Icons.info, color: Colors.blue, size: 30),
                                          onPressed: () => showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
          AlertDialog(
            title: const Text(
              'Detalle del proceso',
              style: TextStyle(color: Colors.black, fontSize: 23),
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Divider(),
                SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Tipo de Máquina: ${proceso.tipoDeMaquina}', style: TextStyle(fontSize: 15, color: Colors.black)),
              Text('Cantidad Total: ${proceso.cantidadTotal}', style: TextStyle(fontSize: 15, color: Colors.black) ),
              Text('Cantidad Asignada: ${proceso.cantidadAsignada}', style: TextStyle(fontSize: 15, color: Colors.black) ),
              Text('Cantidad Pendiente: ${proceso.cantidadPendiente}', style: TextStyle(fontSize: 15, color: Colors.black) ),
              Text('Cantidad Terminada: ${proceso.cantidadHecha}', style: TextStyle(fontSize: 15, color: Colors.black) ),
            ],
          ),
                ),
                Divider(),
              ],
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: ElevatedButton(
          onPressed: () => Navigator.pop(context, 'Cerrar'),
          child: const Text('Cerrar', style: TextStyle(fontSize: 15, color: Colors.black)),
                ),
              ),
            ],
          )
                                          ),
                                        ),
                                      ));
                                    },
                                  ),
                                ),
          
                                // Text(data.procesoEnReferenciaEnPedidos[0].proceso),
                              ],
                            ))))
                      ],
                    ),
                  );
                },
              ),
              ),
        ));
  }
}
