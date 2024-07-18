import '../otherdata/Time.dart';

class Account {
  String id;
  String username;
  String password;
  String firstName;
  String lastName;
  double money;
  String address;
  String phoneNum;
  int lockstatus;
  Time createTime;

  Account({required this.id, required this.username, required this.password, required this.address, required this.createTime, required this.money, required this.firstName, required this.lastName, required this.phoneNum, required this.lockstatus});

  Map<dynamic, dynamic> toJson() => {
    'id': id,
    'createTime': createTime.toJson(),
    'username': username,
    'password': password,
    'firstName': firstName,
    'lastName': lastName,
    'money': money,
    'address': address,
    'phoneNum': phoneNum,
    'lockstatus': lockstatus,
  };

  factory Account.fromJson(Map<dynamic, dynamic> json) {
    return Account(
      id: json['id'].toString(),
      username: json['username'].toString(),
      password: json['password'].toString(),
      firstName: json['firstName'].toString(),
      lastName: json['lastName'].toString(),
      address: json['address'].toString(),
      phoneNum: json['phoneNum'].toString(),
      money: double.parse(json['money'].toString()),
      lockstatus: int.parse(json['lockstatus'].toString()),
      createTime: Time.fromJson(json['createTime']),
    );
  }
}
