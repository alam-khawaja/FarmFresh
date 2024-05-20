import 'package:farm_your_food/global/enums/product_categorie.dart';

class ProductModel {
  final String? id;
  final String? storeId;
  final String? name;
  final String? category;
  final double? price;
  final double? discountPrice;
  final String? description;
  final List<String>? imageUrls;

  ProductModel({
    this.id,
    this.storeId,
    this.name,
    this.category,
    this.price,
    this.discountPrice,
    this.description,
    this.imageUrls,
  });

  ProductModel copyWith({
    String? id,
    String? storeId,
    String? name,
    String? category,
    double? price,
    double? discountPrice,
    String? description,
    List<String>? imageUrls,
  }) {
    return ProductModel(
      id: id ?? this.id,
      storeId: storeId ?? this.storeId,
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
      discountPrice: discountPrice ?? this.discountPrice,
      description: description ?? this.description,
      imageUrls: imageUrls ?? this.imageUrls,
    );
  }

  factory ProductModel.empty() {
    return ProductModel();
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String?,
      storeId: json['storeId'] as String?,
      name: json['name'] as String?,
      category: json['category'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      discountPrice: (json['discountPrice'] as num?)?.toDouble(),
      description: json['description'] as String?,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'storeId': storeId,
      'name': name,
      'category': category,
      'price': price,
      'discountPrice': discountPrice,
      'description': description,
      'imageUrls': imageUrls,
    };
  }
}
