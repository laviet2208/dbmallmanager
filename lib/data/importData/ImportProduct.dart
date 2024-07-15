import 'package:flutter/material.dart';
import '../product/Product.dart';
import 'CostData.dart';

class ImportProduct {
  String id;
  Product product;
  int number;
  double usCost;
  double usShip;
  String cusInfo;
  String orderDate;
  String senDate;
  String otherNote;
  String employee;
  Costdata collected;
  Costdata shipcost;
  String orderId;
  int productStatus; // 0:Không có gì, 1: Có hàng, 2: Order hàng, 3: hết hàng
  int noteStatus; // 0:Không có gì, 1: Hàng Mỹ chính hãng
  int customStatus; // 0:Không có gì, 1: Khách cũ
  int productIdStatus; // 0:Không có gì, 1: Đơn giao gấp
  int productNameStatus; // 0:Không có gì, 1: Khuyến mãi

  ImportProduct({
    required this.id,
    required this.product,
    required this.number,
    required this.usCost,
    required this.usShip,
    required this.cusInfo,
    required this.orderDate,
    required this.senDate,
    required this.otherNote,
    required this.employee,
    required this.collected,
    required this.shipcost,
    required this.customStatus,
    required this.noteStatus,
    required this.productIdStatus,
    required this.productNameStatus,
    required this.productStatus,
    required this.orderId,
  });

  Map<dynamic, dynamic> toJson() => {
    'id': id,
    'product': product.toJson(),
    'number': number,
    'usCost': usCost,
    'usShip': usShip,
    'cusInfo': cusInfo,
    'orderDate': orderDate,
    'senDate': senDate,
    'otherNote': otherNote,
    'employee': employee,
    'collected': collected.toJson(),
    'shipcost': shipcost.toJson(),
    'customStatus': customStatus,
    'noteStatus': noteStatus,
    'productIdStatus': productIdStatus,
    'productNameStatus': productNameStatus,
    'productStatus': productStatus,
    'orderId': orderId,
  };

  factory ImportProduct.fromJson(Map<dynamic, dynamic> json) {
    return ImportProduct(
      id: json['id'].toString(),
      product: Product.fromJson(json['product']),
      number: int.parse(json['number'].toString()),
      usCost: double.parse(json['usCost'].toString()),
      usShip: double.parse(json['usShip'].toString()),
      cusInfo: json['cusInfo'].toString(),
      orderDate: json['orderDate'].toString(),
      senDate: json['senDate'].toString(),
      otherNote: json['otherNote'].toString(),
      employee: json['employee'].toString(),
      collected: Costdata.fromJson(json['collected']),
      shipcost: Costdata.fromJson(json['shipcost']),
      customStatus: int.parse(json['customStatus'].toString()),
      noteStatus: int.parse(json['noteStatus'].toString()),
      productIdStatus: int.parse(json['productIdStatus'].toString()),
      productNameStatus: int.parse(json['productNameStatus'].toString()),
      productStatus: int.parse(json['productStatus'].toString()),
      orderId: json['orderId'].toString(),
    );
  }
}

