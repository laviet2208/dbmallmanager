class ProductNum {
  String id;
  int number;
  ProductNum({required this.id, required this.number});

  Map<dynamic, dynamic> toJson() => {
    'id': id,
    'number': number,
  };

  factory ProductNum.fromJson(Map<dynamic, dynamic> json) {
    return ProductNum(
      id: json['id'].toString(),
      number: int.parse(json['number'].toString()),
    );
  }
}