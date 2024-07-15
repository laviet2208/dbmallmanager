class TextAds {
  String id;
  String title;
  String subTitle;
  String productId;

  TextAds({required this.id, required this.title, required this.productId, required this.subTitle});

  Map<dynamic, dynamic> toJson() => {
    'id': id,
    'title': title,
    'subTitle': subTitle,
    'productId': productId,
  };

  factory TextAds.fromJson(Map<dynamic, dynamic> json) {
    return TextAds(
      id: json['id'].toString(),
      title: json['title'].toString(),
      subTitle: json['subTitle'].toString(),
      productId: json['productId'].toString(),
    );
  }
}