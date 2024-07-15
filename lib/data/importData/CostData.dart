class Costdata {
  String type;
  double cost;

  Costdata({required this.cost, required this.type});

  Map<dynamic, dynamic> toJson() => {
    'type': type,
    'cost': cost,
  };

  factory Costdata.fromJson(Map<dynamic, dynamic> json) {
    return Costdata(
      cost: double.parse(json['cost'].toString()),
      type: json['type'].toString(),
    );
  }
}