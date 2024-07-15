import '../Customer/Customer.dart';
import '../otherdata/Time.dart';
import '../voucherData/Voucher.dart';
import 'OtherData.dart';
import 'ProductNum.dart';

class Order {
  String id;
  Customer customer;
  List<ProductNum> productList;
  Voucher voucher;
  Otherdata otherdata;
  String note;
  double cost;
  Time createTime;
  double shipCost;
  String status; // A: Chưa hoàn thành, B: đã hoàn thành, C: Bị hủy, D: Đã mua đủ hàng ở Mỹ, E: Đã giao hàng, F: Tạo đơn trả hàng
  double discount;

  Order({required this.id, required this.customer, required this.discount, required this.otherdata, required this.voucher, required this.productList, required this.note, required this.cost, required this.shipCost, required this.status, required this.createTime});

  Map<dynamic, dynamic> toJson() => {
    'id': id,
    'customer': customer.toJson(),
    'voucher': voucher.toJson(),
    'otherdata': otherdata.toJson(),
    'note': note,
    'cost': cost,
    'shipCost': shipCost,
    'status': status,
    'createTime': createTime.toJson(),
    'productList': productList.map((e) => e.toJson()).toList(),
    'discount': discount,
  };

  factory Order.fromJson(Map<dynamic, dynamic> json) {
    List<ProductNum> prdList = [];

    if (json["productList"] != null) {
      for (final result in json["productList"]) {
        prdList.add(ProductNum.fromJson(result));
      }
    }

    return Order(
      id: json['id'].toString(),
      createTime: Time.fromJson(json['createTime']),
      cost: double.parse(json['cost'].toString()),
      customer: Customer.fromJson(json['customer']),
      voucher: Voucher.fromJson(json['voucher']),
      otherdata: Otherdata.fromJson(json['otherdata']),
      productList: prdList,
      note: json['note'].toString(),
      shipCost: double.parse(json['shipCost'].toString()),
      status: json['status'].toString(),
      discount: double.parse(json['discount'].toString()),
    );
  }


}