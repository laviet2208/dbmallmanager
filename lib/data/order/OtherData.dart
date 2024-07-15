class Otherdata {
  String sellLocation;
  String sellEmployee;
  String source;

  Otherdata({required this.sellEmployee, required this.sellLocation, required this.source});

  Map<dynamic, dynamic> toJson() => {
    'sellLocation': sellLocation,
    'sellEmployee': sellEmployee,
    'source': source,
  };

  factory Otherdata.fromJson(Map<dynamic, dynamic> json) {
    return Otherdata(
      sellLocation: json['sellLocation'].toString(),
      sellEmployee: json['sellEmployee'].toString(),
      source: json['source'].toString(),
    );
  }
}