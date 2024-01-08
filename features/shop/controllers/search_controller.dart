import 'package:YumeBazaar/data/repositories/product/product_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class YbSearchController extends GetxController {
  static YbSearchController get instance => Get.find();

  RxList<ProductModel> searchResults = <ProductModel>[].obs;
  RxBool isLoading = false.obs;
  RxString lastSearchQuery = ''.obs;
  RxDouble minPrice = 0.0.obs;
  RxDouble maxPrice = double.infinity.obs;
  final RxString searchQuery = ''.obs;
  final RxString selectedCategoryId = ''.obs;
  List<String> sortingOptions = ['Name', 'Lowest Price', 'Highest Price', 'Popular', 'Newest', 'Suitable'];
  RxString selectedSortingOption = 'Name'.obs; // Default sorting option

  void search() {
    searchProducts(
      searchQuery.value,
      categoryId: selectedCategoryId.value.isNotEmpty ? selectedCategoryId.value : null,
      minPrice: minPrice.value != 0.0 ? minPrice.value : null,
      maxPrice: maxPrice.value != double.infinity ? maxPrice.value : null,
      sortingOption: selectedSortingOption.value,
    );
  }

  // void searchProducts(String query, {String? categoryId, String? brandId, double? minPrice, double? maxPrice, required String sortingOption}) async {
  //   lastSearchQuery.value = query;
  //   isLoading.value = true;

  //   try {
  //     final results = await ProductRepository.instance.searchProducts(query, categoryId: categoryId, brandId: brandId, maxPrice: maxPrice, minPrice: minPrice);

  //     // Apply sorting
  //     switch (sortingOption) {
  //       case 'Name':
  //         // Sort by name
  //         results.sort((a, b) => a.title.compareTo(b.title));
  //         break;
  //       case 'Lowest Price':
  //         // Sort by price in ascending order
  //         results.sort((a, b) => a.price.compareTo(b.price));
  //         break;
  //       case 'Highest Price':
  //         // Sort by price in descending order
  //         results.sort((a, b) => b.price.compareTo(a.price));
  //         break;
  //       // Add other sorting cases as needed
  //     }

  //     // Update searchResults with sorted results
  //     searchResults.assignAll(results);
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Error fetching data: $e');
  //     }
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  void searchProducts(String query, {String? categoryId, String? brandId, double? minPrice, double? maxPrice, required String sortingOption}) async {
    lastSearchQuery.value = query;
    isLoading.value = true;

    try {
      // final results = await ProductRepository.instance.searchProducts(query, categoryId: categoryId, brandId: brandId, maxPrice: maxPrice, minPrice: minPrice);
      final results = await ProductRepository.instance.getAllProducts();

      // Apply filtering based on the search query
      List<ProductModel> filteredResults = results
          .where((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()) || (product.description != null && product.description!.toLowerCase().contains(query.toLowerCase())))
          .toList();

      // Apply sorting
      switch (sortingOption) {
        case 'Name':
          // Sort by name
          filteredResults.sort((a, b) => a.title.compareTo(b.title));
          break;
        case 'Lowest Price':
          // Sort by price in ascending order
          filteredResults.sort((a, b) => a.price.compareTo(b.price));
          break;
        case 'Highest Price':
          // Sort by price in descending order
          filteredResults.sort((a, b) => b.price.compareTo(a.price));
          break;
        // Add other sorting cases as needed
      }

      // Update searchResults with filtered and sorted results
      searchResults.assignAll(filteredResults);
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    } finally {
      isLoading.value = false;
    }
  }
}
