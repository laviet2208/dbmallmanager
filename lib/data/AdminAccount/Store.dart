import '../otherdata/Time.dart';

class Store {
  String id;
  String name;
  String address;
  Time createTime;

  Store({required this.name, required this.id, required this.address, required this.createTime});

  Map<dynamic, dynamic> toJson() => {
    'id': id,
    'name': name,
    'address': address,
    'createTime': createTime.toJson(),
  };

  factory Store.fromJson(Map<dynamic, dynamic> json) {
    return Store(
      id: json['id'].toString(),
      createTime: Time.fromJson(json['createTime']),
      name: json['name'].toString(),
      address: json['address'].toString(),
    );
  }
}