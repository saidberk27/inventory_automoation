class Product {
  String title;
  String description;
  int stockCount;
  int buyPrice;
  int tagPrice;
  int retailPrice; // PSF
  String? mediaURL;
  String categoryID;

  Product(
      {this.mediaURL,
      required this.title,
      required this.description,
      required this.stockCount,
      required this.categoryID,
      required this.buyPrice,
      required this.tagPrice,
      required this.retailPrice});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        title: json['title'] as String,
        description: json['description'] as String,
        stockCount: json['stockCount'] as int,
        buyPrice: json['buyPrice'] as int,
        tagPrice: json['tagPrice'] as int,
        retailPrice: json['retailPrice'] as int,
        mediaURL: json['mediaURL'] as String,
        categoryID: json['categoryID'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'stockCount': stockCount,
      'buyPrice': buyPrice,
      'tagPrice': tagPrice,
      'retailPrice': retailPrice,
      'mediaURL': mediaURL,
      'categoryID': categoryID,
    };
  }
}
