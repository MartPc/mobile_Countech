import 'package:accordion/accordion.dart';
import 'package:countech_app/infrastructure/models/sales.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class SaleView extends StatefulWidget {
  const SaleView({super.key});

  @override
  State<SaleView> createState() => _SaleViewState();
}

class _SaleViewState extends State<SaleView> {
  List<Sales>? sales;
  List<Sales>? filterItems;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final Dio dio = Dio();

    try {
      final response =
          await dio.get("https://backend-countech-1.onrender.com/api/produccion/mobile");

      setState(() {
        sales = List<Map<String, dynamic>>.from(response.data)
            .map((e) => Sales.fromJson(e))
            .toList();
        filterItems = sales
            ?.where((element) => element.estado == 'Terminado')
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  void searchItem(String text) {
    setState(() {
      filterItems = sales!
          .where(
              (i) => i.ordenTrabajo.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
  }

  void _showProcessDialog(List<ProcesoEnReferenciaEnPedido> procesos) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Procesos'),
          content: SingleChildScrollView(
            child: DataTable(
              columns: [
                DataColumn(label: Text('Proceso')),
                DataColumn(label: Text('Máquina')),
                // Agrega más DataColumn según sea necesario
              ],
              rows: procesos
                  .map((proceso) => DataRow(
                        cells: [
                          DataCell(Text(proceso.proceso)),
                          DataCell(Text(proceso.tipoDeMaquina)),
                          // Agrega más DataCell según sea necesario
                        ],
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  void _showColorDialog(List<ProcesoEnReferenciaEnPedido> procesos) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Colores'),
          content: SingleChildScrollView(
            child: DataTable(
              columnSpacing: 10.0,
              columns: [
                DataColumn(label: Text('Color')),
                DataColumn(label: Text('S')),
                DataColumn(label: Text('M')),
                DataColumn(label: Text('L')),
                DataColumn(label: Text('XL')),
                DataColumn(label: Text('Total')),
                // Agrega más DataColumn según sea necesario
              ],
              rows: procesos
                  .expand((proceso) => proceso.colorEnProcesoEnReferenciaEnPedidos)
                  .map((color) => DataRow(
                        cells: [
                          DataCell(Text(color.color)),
                          DataCell(Text(color.tallaS.toString())),
                          DataCell(Text(color.tallaM.toString())),
                          DataCell(Text(color.tallaL.toString())),
                          DataCell(Text(color.tallaXl.toString())),
                          DataCell(Text(color.cantidadTotal.toString())),
                          // Agrega más DataCell según sea necesario
                        ],
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextField(
          decoration: InputDecoration(hintText: 'Buscar venta'),
          onChanged: searchItem,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: getData,
        child: Center(
          child: Container(
            margin: EdgeInsets.all(10),
            child: filterItems == null
                ? CircularProgressIndicator()
                : filterItems!.isEmpty
                    ? Text('No se encontraron ventas')
                    : ListView.builder(
                        itemCount: filterItems?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          final data = filterItems![index];
                          return Container(
                            child: Accordion(
                              headerBackgroundColor: Color.fromARGB(255, 255, 255, 255),
                              headerBorderColor: Colors.grey,
                              headerBorderWidth: 1,
                              contentBorderColor: Colors.grey,
                              contentBorderWidth: 1,
                              paddingListTop: 0,
                              paddingListBottom: 0,
                              contentHorizontalPadding: 5,
                              rightIcon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 33,
                                color: Colors.black,
                              ),
                              headerPadding: const EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 25),
                              children: [
                                AccordionSection(
                                  header: Container(
                                    height: MediaQuery.of(context).size.height * 0.14,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Valor Total:',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Fecha:',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),                                                                                                        
                                                    Text(
                                                      'Cliente:',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Forma de pago:',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Orden de trabajo:',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),                                                                                                        
                                                  ],
                                                ),
                                                SizedBox(width: 5), // Espacio entre etiquetas y valores
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${NumberFormat.currency(symbol: '\$', decimalDigits: 0).format(double.parse(data.valorTotal))}',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${data.fechaEntregaOrden.toLocal()}'.split(' ')[0], // Formato de fecha: año/mes/día
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                      ),
                                                    ),                                                    
                                                    Text(
                                                      '${data.cliente.nombreComercial}',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${data.formaPago}',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${data.ordenTrabajo}',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                      ),
                                                    ),                                                                                                        
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  content: Container(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Referencia: ${data.referencia}',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                Text(
                                                  'Descripción: ${data.descripcion}',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                Text(
                                                  'Valor Unitario: ${data.valorUnitario}',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              _showProcessDialog(data.procesoEnReferenciaEnPedidos);
                                            },
                                            child: Text('Ver Procesos'),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              _showColorDialog(data.procesoEnReferenciaEnPedidos);
                                            },
                                            child: Text('Ver Colores'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
          ),
        ),
     ),
);
}
}