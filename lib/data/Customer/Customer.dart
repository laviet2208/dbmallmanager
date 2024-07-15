class Customer {
  String id;
  String name;
  String phone;
  String address;
  String otherContact;
  int orderNumber;

  Customer({required this.id, required this.name, required this.phone, required this.address, required this.otherContact, required this.orderNumber});

  Map<dynamic, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'address': address,
    'otherContact': otherContact,
    'orderNumber': orderNumber,
  };

  factory Customer.fromJson(Map<dynamic, dynamic> json) {
    return Customer(
      id: json['id'].toString(),
      phone: json['phone'].toString(),
      name: json['name'].toString(),
      address: json['address'].toString(),
      otherContact: json['otherContact'].toString(),
      orderNumber: int.parse(json['orderNumber'].toString()),
    );
  }
}