import '../otherdata/Time.dart';
class Employee {
  String id;
  Time createTime;
  String name;
  String phone;
  String username;
  String password;

  Employee({required this.id, required this.name, required this.phone, required this.createTime, required this.username, required this.password});

  Map<dynamic, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'createTime': createTime.toJson(),
    'username': username,
    'password': password,
  };

  factory Employee.fromJson(Map<dynamic, dynamic> json) {
    return Employee(
      id: json['id'].toString(),
      phone: json['phone'].toString(),
      name: json['name'].toString(),
      createTime: Time.fromJson(json['createTime']),
      username: json['username'].toString(),
      password: json['password'].toString(),
    );
  }
}