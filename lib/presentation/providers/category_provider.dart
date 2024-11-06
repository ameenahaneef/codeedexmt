import 'package:flutter/material.dart';
import 'package:codeedexmt/data/models/category_model.dart';
import 'package:codeedexmt/data/services/api_service.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [];
  bool _isLoading = false;
  bool _isLoaded = false;

  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;
  bool get isLoaded => _isLoaded;

  Future<void> category() async {
    _isLoading = true;
    notifyListeners();
    try {
      _categories = await fetchCategories();
      _isLoaded = true;
    } catch (error) {
      _isLoaded = false;
      print("Error fetching categories: $error");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
