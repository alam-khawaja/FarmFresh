import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_your_food/app/models/product_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductRepository {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static final CollectionReference productsRef = _db.collection('products');

  ProductRepository._();

  static Future<DocumentReference> createProduct(ProductModel product) async {
    try {
      DocumentReference storeRef = await productsRef.add(product.toJson());
      return storeRef;
    } catch (e) {
      print('Error creating product: $e');
      throw Exception('Failed to create product');
    }
  }

  static Future<void> updateProduct(ProductModel product) async {
    try {
      await productsRef.doc(product.id).update(product.toJson());
    } catch (e) {
      print('Error updating product: $e');
      throw Exception('Failed to update product');
    }
  }

  static Future<void> deleteProduct(String id) async {
    try {
      await productsRef.doc(id).delete();
    } catch (e) {
      print('Error deleting product: $e');
      throw Exception('Failed to delete product');
    }
  }

  static Stream<List<ProductModel>> streamProducts() {
    return productsRef.snapshots().map((QuerySnapshot query) {
      return query.docs
          .map((doc) =>
              ProductModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }

  static Future<ProductModel?> getProductByUserId(String userId) async {
    QuerySnapshot snapshot =
        await productsRef.where('storeId', isEqualTo: userId).limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      return ProductModel.fromJson(
          snapshot.docs.first.data() as Map<String, dynamic>);
    }
    return null;
  }

  static Future<String> uploadImage(File image) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference =
          FirebaseStorage.instance.ref().child('productImages/$fileName');
      UploadTask uploadTask = reference.putFile(image);
      TaskSnapshot snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print('Error uploading image: $e');
      throw Exception('Failed to upload image');
    }
  }

  static Future<List<ProductModel>> getProductsByStoreId(String storeId) async {
    try {
      QuerySnapshot snapshot =
          await productsRef.where('storeId', isEqualTo: storeId).get();
      return snapshot.docs
          .map((doc) =>
              ProductModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }
}
