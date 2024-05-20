import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_your_food/app/models/store_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:geolocator/geolocator.dart';

class StoreRepository {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static final FirebaseStorage _storage = FirebaseStorage.instance;
  static final CollectionReference storesRef = _db.collection('stores');

  StoreRepository._();

  static Future<void> createStore(StoreModel store) async {
    try {
      StoreModel? existingStore = await getStoreByUserId(store.id!);
      if (existingStore != null) {
        throw Exception('User can only create one store');
      }
      await storesRef.doc(store.id).set(
        store.toJson(),
        SetOptions(merge: true),
      );
    } catch (e) {
      print('Error creating store: $e');
      throw Exception('Failed to create store');
    }
  }

  static Future<StoreModel?> getStoreByUserId(String userId) async {
    QuerySnapshot snapshot = await _db.collection('stores').where('id', isEqualTo: userId).get();

    if (snapshot.docs.isNotEmpty) {
      return StoreModel.fromJson(snapshot.docs.first.data() as Map<String, dynamic>);
    }
    return null;
  }

  static Future<StoreModel?> getCurrentFarmerStore(String userId) async {
    try {
      DocumentSnapshot doc = await storesRef.doc(userId).get();
      if (doc.exists) {
        return StoreModel.fromJson(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print('Error getting current farmer store: $e');
      throw Exception('Failed to get current farmer store');
    }
  }

  static Future<void> deleteStore(String id) async {
    try {
      await storesRef.doc(id).delete();
    } catch (e) {
      print('Error deleting store: $e');
      throw Exception('Failed to delete store');
    }
  }

  static Stream<List<StoreModel>> streamStores() {
    return storesRef.snapshots().map((QuerySnapshot query) {
      return query.docs.map((doc) => StoreModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    });
  }

  static Future<String> uploadImage(File image) async {
    Reference ref = _storage.ref().child('store_images/${DateTime.now().millisecondsSinceEpoch}');
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  static Future<List<StoreModel>> filterStoresByRating(double rating) async {
    QuerySnapshot snapshot = await storesRef.where('rating', isGreaterThanOrEqualTo: rating).get();
    return snapshot.docs.map((doc) => StoreModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }

  static Future<List<StoreModel>> filterStoresByLocation(double latitude, double longitude, double radiusInKm) async {
    QuerySnapshot snapshot = await storesRef.get();
    List<StoreModel> allStores = snapshot.docs.map((doc) => StoreModel.fromJson(doc.data() as Map<String, dynamic>)).toList();

    return allStores.where((store) {
      double distanceInMeters = Geolocator.distanceBetween(latitude, longitude, store.latitude!, store.longitude!);
      return distanceInMeters / 1000 <= radiusInKm;
    }).toList();
  }
}
