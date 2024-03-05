// To parse this JSON data, do
//
//     final production = productionFromJson(jsonString);

import 'dart:convert';

List<Production> productionFromJson(String str) => List<Production>.from(json.decode(str).map((x) => Production.fromJson(x)));

String productionToJson(List<Production> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Production {
    final int id;
    final int productionCliente;
    final String ordenTrabajo;
    final DateTime fechaOrdenTrabajo;
    final DateTime fechaRegistro;
    final DateTime fechaEntregaOrden;
    final String formaPago;
    final String valorTotal;
    final String observaciones;
    final String estado;
    final String estadoPago;
    final dynamic fechaVenta;
    final bool estadoPedido;
    final dynamic motivoDeAnulacion;
    final String referencia;
    final String descripcion;
    final String valorUnitario;
    final int cantidadTotal;
    final DateTime createdAt;
    final DateTime updatedAt;
    final Cliente cliente;
    final List<ProcesoEnReferenciaEnPedido> procesoEnReferenciaEnPedidos;

    Production({
        required this.id,
        required this.productionCliente,
        required this.ordenTrabajo,
        required this.fechaOrdenTrabajo,
        required this.fechaRegistro,
        required this.fechaEntregaOrden,
        required this.formaPago,
        required this.valorTotal,
        required this.observaciones,
        required this.estado,
        required this.estadoPago,
        required this.fechaVenta,
        required this.estadoPedido,
        required this.motivoDeAnulacion,
        required this.referencia,
        required this.descripcion,
        required this.valorUnitario,
        required this.cantidadTotal,
        required this.createdAt,
        required this.updatedAt,
        required this.cliente,
        required this.procesoEnReferenciaEnPedidos,
    });

    factory Production.fromJson(Map<String, dynamic> json) => Production(
        id: json["id"],
        productionCliente: json["cliente"],
        ordenTrabajo: json["ordenTrabajo"],
        fechaOrdenTrabajo: DateTime.parse(json["fechaOrdenTrabajo"]),
        fechaRegistro: DateTime.parse(json["fechaRegistro"]),
        fechaEntregaOrden: DateTime.parse(json["fechaEntregaOrden"]),
        formaPago: json["formaPago"],
        valorTotal: json["valorTotal"],
        observaciones: json["observaciones"],
        estado: json["estado"],
        estadoPago: json["estadoPago"],
        fechaVenta: json["fechaVenta"],
        estadoPedido: json["estadoPedido"],
        motivoDeAnulacion: json["motivoDeAnulacion"],
        referencia: json["referencia"],
        descripcion: json["descripcion"],
        valorUnitario: json["valorUnitario"],
        cantidadTotal: json["cantidadTotal"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        cliente: Cliente.fromJson(json["Cliente"]),
        procesoEnReferenciaEnPedidos: List<ProcesoEnReferenciaEnPedido>.from(json["ProcesoEnReferenciaEnPedidos"].map((x) => ProcesoEnReferenciaEnPedido.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cliente": productionCliente,
        "ordenTrabajo": ordenTrabajo,
        "fechaOrdenTrabajo": "${fechaOrdenTrabajo.year.toString().padLeft(4, '0')}-${fechaOrdenTrabajo.month.toString().padLeft(2, '0')}-${fechaOrdenTrabajo.day.toString().padLeft(2, '0')}",
        "fechaRegistro": "${fechaRegistro.year.toString().padLeft(4, '0')}-${fechaRegistro.month.toString().padLeft(2, '0')}-${fechaRegistro.day.toString().padLeft(2, '0')}",
        "fechaEntregaOrden": "${fechaEntregaOrden.year.toString().padLeft(4, '0')}-${fechaEntregaOrden.month.toString().padLeft(2, '0')}-${fechaEntregaOrden.day.toString().padLeft(2, '0')}",
        "formaPago": formaPago,
        "valorTotal": valorTotal,
        "observaciones": observaciones,
        "estado": estado,
        "estadoPago": estadoPago,
        "fechaVenta": fechaVenta,
        "estadoPedido": estadoPedido,
        "motivoDeAnulacion": motivoDeAnulacion,
        "referencia": referencia,
        "descripcion": descripcion,
        "valorUnitario": valorUnitario,
        "cantidadTotal": cantidadTotal,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "Cliente": cliente.toJson(),
        "ProcesoEnReferenciaEnPedidos": List<dynamic>.from(procesoEnReferenciaEnPedidos.map((x) => x.toJson())),
    };
}

class Cliente {
    final int id;
    final String tipoCliente;
    final String tipoIdentificacion;
    final String numeroIdentificacion;
    final String razonSocial;
    final String nombreComercial;
    final String ciudad;
    final String direccion;
    final String contacto;
    final String telefono;
    final String correo;
    final bool estado;
    final DateTime createdAt;
    final DateTime updatedAt;

    Cliente({
        required this.id,
        required this.tipoCliente,
        required this.tipoIdentificacion,
        required this.numeroIdentificacion,
        required this.razonSocial,
        required this.nombreComercial,
        required this.ciudad,
        required this.direccion,
        required this.contacto,
        required this.telefono,
        required this.correo,
        required this.estado,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        id: json["id"],
        tipoCliente: json["tipoCliente"],
        tipoIdentificacion: json["tipoIdentificacion"],
        numeroIdentificacion: json["numeroIdentificacion"],
        razonSocial: json["razonSocial"],
        nombreComercial: json["nombreComercial"],
        ciudad: json["ciudad"],
        direccion: json["direccion"],
        contacto: json["contacto"],
        telefono: json["telefono"],
        correo: json["correo"],
        estado: json["estado"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipoCliente": tipoCliente,
        "tipoIdentificacion": tipoIdentificacion,
        "numeroIdentificacion": numeroIdentificacion,
        "razonSocial": razonSocial,
        "nombreComercial": nombreComercial,
        "ciudad": ciudad,
        "direccion": direccion,
        "contacto": contacto,
        "telefono": telefono,
        "correo": correo,
        "estado": estado,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class ProcesoEnReferenciaEnPedido {
    final int id;
    final int pedido;
    final String proceso;
    final String tipoDeMaquina;
    final int cantidadTotal;
    final int cantidadAsignada;
    final int cantidadHecha;
    final int cantidadPendiente;
    final bool estado;
    final DateTime createdAt;
    final DateTime updatedAt;
    final List<AsignarProcesoEmpleado> asignarProcesoEmpleados;
    final List<ColorEnProcesoEnReferenciaEnPedido> colorEnProcesoEnReferenciaEnPedidos;

    ProcesoEnReferenciaEnPedido({
        required this.id,
        required this.pedido,
        required this.proceso,
        required this.tipoDeMaquina,
        required this.cantidadTotal,
        required this.cantidadAsignada,
        required this.cantidadHecha,
        required this.cantidadPendiente,
        required this.estado,
        required this.createdAt,
        required this.updatedAt,
        required this.asignarProcesoEmpleados,
        required this.colorEnProcesoEnReferenciaEnPedidos,
    });

    factory ProcesoEnReferenciaEnPedido.fromJson(Map<String, dynamic> json) => ProcesoEnReferenciaEnPedido(
        id: json["id"],
        pedido: json["pedido"],
        proceso: json["proceso"],
        tipoDeMaquina: json["tipoDeMaquina"],
        cantidadTotal: json["cantidadTotal"],
        cantidadAsignada: json["cantidadAsignada"],
        cantidadHecha: json["cantidadHecha"],
        cantidadPendiente: json["cantidadPendiente"],
        estado: json["estado"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        asignarProcesoEmpleados: List<AsignarProcesoEmpleado>.from(json["asignarProcesoEmpleados"].map((x) => AsignarProcesoEmpleado.fromJson(x))),
        colorEnProcesoEnReferenciaEnPedidos: List<ColorEnProcesoEnReferenciaEnPedido>.from(json["ColorEnProcesoEnReferenciaEnPedidos"].map((x) => ColorEnProcesoEnReferenciaEnPedido.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "pedido": pedido,
        "proceso": proceso,
        "tipoDeMaquina": tipoDeMaquina,
        "cantidadTotal": cantidadTotal,
        "cantidadAsignada": cantidadAsignada,
        "cantidadHecha": cantidadHecha,
        "cantidadPendiente": cantidadPendiente,
        "estado": estado,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "asignarProcesoEmpleados": List<dynamic>.from(asignarProcesoEmpleados.map((x) => x.toJson())),
        "ColorEnProcesoEnReferenciaEnPedidos": List<dynamic>.from(colorEnProcesoEnReferenciaEnPedidos.map((x) => x.toJson())),
    };
}

class AsignarProcesoEmpleado {
    final int id;
    final int cantidadAsignada;
    final int cantRestante;
    final bool estadoProcAsig;
    final bool estadoAnular;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int pedidoprocesoId;
    final int empleadoId;
    final List<AvanceProcesoEmpleado> avanceProcesoEmpleados;

    AsignarProcesoEmpleado({
        required this.id,
        required this.cantidadAsignada,
        required this.cantRestante,
        required this.estadoProcAsig,
        required this.estadoAnular,
        required this.createdAt,
        required this.updatedAt,
        required this.pedidoprocesoId,
        required this.empleadoId,
        required this.avanceProcesoEmpleados,
    });

    factory AsignarProcesoEmpleado.fromJson(Map<String, dynamic> json) => AsignarProcesoEmpleado(
        id: json["id"],
        cantidadAsignada: json["cantidadAsignada"],
        cantRestante: json["cantRestante"],
        estadoProcAsig: json["estadoProcAsig"],
        estadoAnular: json["estadoAnular"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        pedidoprocesoId: json["pedidoprocesoId"],
        empleadoId: json["empleadoId"],
        avanceProcesoEmpleados: List<AvanceProcesoEmpleado>.from(json["avanceProcesoEmpleados"].map((x) => AvanceProcesoEmpleado.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cantidadAsignada": cantidadAsignada,
        "cantRestante": cantRestante,
        "estadoProcAsig": estadoProcAsig,
        "estadoAnular": estadoAnular,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "pedidoprocesoId": pedidoprocesoId,
        "empleadoId": empleadoId,
        "avanceProcesoEmpleados": List<dynamic>.from(avanceProcesoEmpleados.map((x) => x.toJson())),
    };
}

class AvanceProcesoEmpleado {
    final int id;
    final int cantidadHecha;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int asignarProcesoEmpleadoId;

    AvanceProcesoEmpleado({
        required this.id,
        required this.cantidadHecha,
        required this.createdAt,
        required this.updatedAt,
        required this.asignarProcesoEmpleadoId,
    });

    factory AvanceProcesoEmpleado.fromJson(Map<String, dynamic> json) => AvanceProcesoEmpleado(
        id: json["id"],
        cantidadHecha: json["cantidadHecha"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        asignarProcesoEmpleadoId: json["asignarProcesoEmpleadoId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cantidadHecha": cantidadHecha,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "asignarProcesoEmpleadoId": asignarProcesoEmpleadoId,
    };
}

class ColorEnProcesoEnReferenciaEnPedido {
    final int id;
    final int proceso;
    final String color;
    final int tallaS;
    final int tallaM;
    final int tallaL;
    final int tallaXl;
    final int cantidadTotal;
    final DateTime createdAt;
    final DateTime updatedAt;

    ColorEnProcesoEnReferenciaEnPedido({
        required this.id,
        required this.proceso,
        required this.color,
        required this.tallaS,
        required this.tallaM,
        required this.tallaL,
        required this.tallaXl,
        required this.cantidadTotal,
        required this.createdAt,
        required this.updatedAt,
    });

    factory ColorEnProcesoEnReferenciaEnPedido.fromJson(Map<String, dynamic> json) => ColorEnProcesoEnReferenciaEnPedido(
        id: json["id"],
        proceso: json["proceso"],
        color: json["color"],
        tallaS: json["tallaS"],
        tallaM: json["tallaM"],
        tallaL: json["tallaL"],
        tallaXl: json["tallaXL"],
        cantidadTotal: json["cantidadTotal"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "proceso": proceso,
        "color": color,
        "tallaS": tallaS,
        "tallaM": tallaM,
        "tallaL": tallaL,
        "tallaXL": tallaXl,
        "cantidadTotal": cantidadTotal,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
