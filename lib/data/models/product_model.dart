class Part {
  final int id;
  final int partsCat;
  final String partImage;
  final int vBrand;
  final int vCategory;
  final String price;
  final String? partsName;
  final String description;
  final String? offerPrice;
  final bool isOffer;
  final String productRating;

  Part({
    required this.id,
    required this.partsCat,
    required this.partImage,
    required this.vBrand,
    required this.vCategory,
    required this.price,
    this.partsName,
    required this.description,
    this.offerPrice,
    required this.isOffer,
    required this.productRating,
  });

  factory Part.fromJson(Map<String, dynamic> json) {
    return Part(
      id: json['id'],
      partsCat: json['parts_Cat'],
      partImage: json['part_image'],
      vBrand: json['v_brand'],
      vCategory: json['v_category'],
      price: json['price'],
      partsName: json['parts_name'],
      description: json['description'],
      offerPrice: json['offer_price'],
      isOffer: json['is_offer'],
      productRating: json['product_rating'],
    );
  }
}
