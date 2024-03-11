import 'package:countech_app/infrastructure/models/employee.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class EmployeeView extends StatefulWidget {
  const EmployeeView({super.key});

  @override
  State<EmployeeView> createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {
  List<Employee>? employees;
  List<Employee>? filterItems;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final Dio dio = Dio();

    try {
      final response = await dio
          .get("https://backend-countech-1.onrender.com/api/empleado/mobile");

      // production = Production.fromJson(response.data);

      setState(() {
        employees = List<Map<String, dynamic>>.from(response.data)
            .map((e) => Employee.fromJson(e))
            .toList();
        filterItems = employees;
      });
    } catch (e) {
      print(e);
    }
  }

      void searchItem(String text) {
    setState(() {
      filterItems = employees!
          .where((i) => i.nombre.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextField(
          decoration: InputDecoration(hintText: 'Buscar por nombre'),
          onChanged: searchItem,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: getData,
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: filterItems == null
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemCount: filterItems?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      final data = filterItems![index];
                      return Card(
                        color: Colors.white,
                        elevation: 0.0,
                          shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0), // Radio de los bordes de la card
    side: BorderSide(color: Colors.grey, width: 1.0), // Borde gris
  ),
                        child: ListTile(
                            title: Text(data.nombre, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                            subtitle: Text(data.apellido, style: TextStyle(fontSize:14)),
                            trailing: Container(
                              child: ElevatedButton(
                                onPressed: () {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Stack(
                                        children: [
                                          Container(
                                            height: 400,
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(20),
                                            child: Column(
                                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Container(
                                                  child: Text(
                                                    'Información del empleado',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text('Estado',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8.0),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: data.estado
                                                                      ? Colors
                                                                          .green
                                                                      : Colors
                                                                          .red,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .circle_rounded,
                                                                      size: 15,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    SizedBox(
                                                                        width:
                                                                            8.0),
                                                                    Text(
                                                                      '${data.estado ? 'Activo' : 'Inactivo'}',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 35,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  'Estado producción',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8.0),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: data
                                                                          .estadoOcupado
                                                                      ? Colors.red
                                                                      : Colors
                                                                          .green,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .circle_rounded,
                                                                      size: 15,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    Text(
                                                                      '${data.estadoOcupado ? 'Ocupado' : 'Disponible'}',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  'Tipo de identidad',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              Text(
                                                                  '${data.tipoIdentidad}'),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  'Número de identidad',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              Text(
                                                                  '${data.numIdentidad}'),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  'Nombre completo',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              Text(
                                                                  '${data.nombre} ${data.apellido}'),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  'Correo electrónico',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              Text(
                                                                  '${data.correo}'),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text('Teléfono',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              Text(
                                                                  '${data.telefono}'),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text('Ciudad',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              Text(
                                                                  '${data.ciudad}'),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text('Dirección',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              Text(
                                                                  '${data.direccion}'),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Divider(),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            top: 8,
                                            right: 8,
                                            child: IconButton(
                                              icon: Icon(Icons.close),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(8),
                                  elevation: 0.0,
                                ),
                                child: Icon(Icons.more_vert),
                              ),
                            ),
                            leading: Container(
                              child: Icon(
                                Icons.circle_rounded,
                                size: 15,
                                color: data.estado ? Colors.green : Colors.red,
                              ),
                            )),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}