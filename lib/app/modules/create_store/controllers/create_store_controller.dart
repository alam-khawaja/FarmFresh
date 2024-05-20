import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_your_food/app/controllers/auth_controller.dart';
import 'package:farm_your_food/app/models/store_model.dart';
import 'package:farm_your_food/app/repository/store_repository.dart';
import 'package:farm_your_food/global/utils/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class CreateStoreController extends GetxController {
  final AuthController authController = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();

  TextEditingController storeNameController = TextEditingController();
  TextEditingController storeTypeController = TextEditingController();
  TextEditingController storeLocationController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController storeDescriptionController = TextEditingController();

  Rx<File> image = File("").obs;
  RxBool isLoading = false.obs;
  RxString formattedAddress = ''.obs;
  final latitude = 0.0.obs;
  final longitude = 0.0.obs;
  Rx<StoreModel?> existingStore = Rx<StoreModel?>(null);
  final storeAlreadyExist = false.obs;
  @override
  void onInit() {
    loadStoreData();
    super.onInit();
  }

  Future<void> loadStoreData() async {
    isLoading.value = true;
    await checkStoreAlreadyExist();
    await Get.find<CreateStoreController>().loadExistingStore();
    isLoading.value = false;
  }

  Future<bool> checkStoreAlreadyExist() async {
    StoreModel? existingStore =
        await StoreRepository.getStoreByUserId(authController.user!.uid);
    if (existingStore != null) {
      storeAlreadyExist.value = true;
      return true;
    } else {
      storeAlreadyExist.value = false;
      return false;
    }
  }

  Future<void> loadExistingStore() async {
    isLoading.value = true;
    StoreModel? store =
        await StoreRepository.getStoreByUserId(authController.user!.uid);
    if (store != null) {
      existingStore.value = store;
      storeNameController.text = store.name ?? '';
      storeTypeController.text = store.storeType ?? '';
      storeLocationController.text = store.storeLocation ?? '';
      streetAddressController.text = store.streetAddress ?? '';
      storeDescriptionController.text = store.description ?? '';
      latitude.value = store.latitude ?? 0.0;
      longitude.value = store.longitude ?? 0.0;
      formattedAddress.value = store.streetAddress ?? '';
    }
    isLoading.value = false;
  }

  void pickImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  Future<void> autoFetchLocation() async {
    await getCurrentLocation();
    storeLocationController.text = formattedAddress.value;
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      bool locationServiceStatus = await Geolocator.openLocationSettings();
      if (!locationServiceStatus) {
        Get.snackbar('Location Error', 'Location services are disabled.');
        return;
      }
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Location Error', 'Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
          'Location Error', 'Location permissions are permanently denied.');
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude.value = position.latitude;
    longitude.value = position.longitude;
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placeMarks[0];
    formattedAddress.value =
        " ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
  }

  Future<void> createOrUpdateStore() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        await getCurrentLocation();
        StoreModel? existingStore =
            await StoreRepository.getStoreByUserId(authController.user!.uid);
        if (existingStore != null) {
          await _updateStore(existingStore);
        } else {
          await _createStore();
        }
      } catch (e) {
        isLoading.value = false;
        Get.snackbar('Error', 'Failed to create/update store: $e');
      }
    }
  }

  Future<void> _createStore() async {
    String imageUrl = '';
    try {
      if (image.value.path.isNotEmpty) {
        imageUrl = await StoreRepository.uploadImage(image.value);
      }

      StoreModel store = StoreModel(
        id: authController.user!.uid,
        name: storeNameController.text,
        latitude: latitude.value,
        longitude: longitude.value,
        streetAddress: streetAddressController.text,
        storeLocation: formattedAddress.value == ''
            ? storeLocationController.text
            : formattedAddress.value,
        storeImage: imageUrl,
        storeType: storeTypeController.text,
        description: storeDescriptionController.text,
        createdAt: Timestamp.now(),
      );

      await StoreRepository.createStore(store);

      Get.back();
      AppDialog.showErrorDialog(
        message: 'Store created successfully',
        title: 'Success',
      );
    } catch (e) {
      isLoading.value = false;
      AppDialog.showErrorDialog(
        message: e.toString(),
      );
    }
  }

  Future<void> _updateStore(StoreModel existingStore) async {
    String imageUrl = existingStore.storeImage ?? '';
    if (image.value.path.isNotEmpty) {
      imageUrl = await StoreRepository.uploadImage(image.value);
    }

    StoreModel updatedStore = existingStore.copyWith(
      name: storeNameController.text,
      streetAddress: streetAddressController.text,
      storeLocation: formattedAddress.value == ''
          ? storeLocationController.text
          : formattedAddress.value,
      storeImage: imageUrl,
      storeType: storeTypeController.text,
      description: storeDescriptionController.text,
    );

    await StoreRepository.createStore(updatedStore);
    isLoading.value = false;
    Get.snackbar('Success', 'Store updated successfully');
    Get.back();
  }
}
