import 'package:farm_your_food/app/repository/store_repository.dart';
import 'package:farm_your_food/app/models/store_model.dart';
import 'package:get/get.dart';

class StoreController extends GetxController {
  RxList<StoreModel> stores = RxList<StoreModel>();
  Rx<StoreModel?> currentFarmerStore = Rx<StoreModel?>(null);

  @override
  void onInit() {
    stores.bindStream(StoreRepository.streamStores());
    super.onInit();
  }

  void createStore(StoreModel store) async {
    try {
      await StoreRepository.createStore(store);
      stores.add(store);
    } catch (e) {
      Get.snackbar('Error', 'Failed to create store: $e');
    }
  }

  void updateStore(StoreModel updatedStore) async {
    try {
      await StoreRepository.createStore(updatedStore);
      int index = stores.indexWhere((s) => s.id == updatedStore.id);
      if (index != -1) {
        stores[index] = updatedStore;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update store: $e');
    }
  }

  void deleteStore(String id) async {
    try {
      await StoreRepository.deleteStore(id);
      stores.removeWhere((s) => s.id == id);
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete store: $e');
    }
  }

  Future<void> getCurrentFarmerStore(String userId) async {
    try {
      currentFarmerStore.value = await StoreRepository.getCurrentFarmerStore(userId);
    } catch (e) {
      Get.snackbar('Error', 'Failed to get current farmer store: $e');
    }
  }

  Future<void> filterStoresByRating(double rating) async {
    try {
      List<StoreModel> filteredStores = await StoreRepository.filterStoresByRating(rating);
      stores.assignAll(filteredStores);
    } catch (e) {
      Get.snackbar('Error', 'Failed to filter stores by rating: $e');
    }
  }

  Future<void> filterStoresByLocation(double latitude, double longitude, double radiusInKm) async {
    try {
      List<StoreModel> filteredStores = await StoreRepository.filterStoresByLocation(latitude, longitude, radiusInKm);
      stores.assignAll(filteredStores);
    } catch (e) {
      Get.snackbar('Error', 'Failed to filter stores by location: $e');
    }
  }
}
