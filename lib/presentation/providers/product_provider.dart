import 'package:codeedexmt/data/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:codeedexmt/data/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<Part> _products = [];
  bool _isLoading = false;
  bool _isLoaded = false;

  List<Part> get products => _products;
  bool get isLoading => _isLoading;
  bool get isLoaded => _isLoaded;

  Future<void> product() async {
    _isLoading = true;
    notifyListeners();
    try {
      _products = await fetchProducts();
      _isLoaded = true;
    } catch (error) {
      _isLoaded = false;
      print("Error fetching products: $error");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
