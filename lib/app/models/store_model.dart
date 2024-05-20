import 'package:cloud_firestore/cloud_firestore.dart';

class StoreModel {
  final String? id;

  final String? name;
  final double? latitude;
  final double? longitude;
  final String? streetAddress;
  final String? storeLocation;
  final String? storeImage;
  final String? storeType;
  final String? description;
  final Timestamp? createdAt;

  StoreModel({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.streetAddress,
    this.storeLocation,
    this.storeImage,
    this.storeType,
    this.description,
    this.createdAt,
  });

  StoreModel copyWith({
    String? id,
    String? name,
    double? latitude,
    double? longitude,
    String? streetAddress,
    String? storeLocation,
    String? storeImage,
    String? storeType,
    String? description,
    Timestamp? createdAt,
  }) {
    return StoreModel(
      id: id ?? this.id,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      streetAddress: streetAddress ?? this.streetAddress,
      storeLocation: storeLocation ?? this.storeLocation,
      storeImage: storeImage ?? this.storeImage,
      storeType: storeType ?? this.storeType,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory StoreModel.empty() {
    return StoreModel();
  }

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
      streetAddress: json['streetAddress'] as String?,
      storeLocation: json['storeLocation'] as String?,
      storeImage: json['storeImage'] as String?,
      storeType: json['storeType'] as String?,
      description: json['description'] as String?,
      createdAt: json['createdAt'] as Timestamp?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'streetAddress': streetAddress,
      'storeLocation': storeLocation,
      'storeImage': storeImage,
      'storeType': storeType,
      'description': description,
      'createdAt': createdAt,
    };
  }
}
