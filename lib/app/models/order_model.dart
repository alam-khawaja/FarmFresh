import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String? id;
  final String? consumerId;
  final String? productId;
  final int? quantity;
  final double? totalPrice;
  final String? shippingAddress;
  final String? status;
  final Timestamp? createdAt;

  OrderModel({
    this.id,
    this.consumerId,
    this.productId,
    this.quantity,
    this.totalPrice,
    this.shippingAddress,
    this.status,
    this.createdAt,
  });

  OrderModel copyWith({
    String? id,
    String? consumerId,
    String? productId,
    int? quantity,
    double? totalPrice,
    String? shippingAddress,
    String? status,
    Timestamp? createdAt,
  }) {
    return OrderModel(
      id: id ?? this.id,
      consumerId: consumerId ?? this.consumerId,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory OrderModel.empty() {
    return OrderModel();
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as String?,
      consumerId: json['consumerId'] as String?,
      productId: json['productId'] as String?,
      quantity: json['quantity'] as int?,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      shippingAddress: json['shippingAddress'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as Timestamp?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'consumerId': consumerId,
      'productId': productId,
      'quantity': quantity,
      'totalPrice': totalPrice,
      'shippingAddress': shippingAddress,
      'status': status,
      'createdAt': createdAt,
    };
  }
}
