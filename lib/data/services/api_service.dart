import 'dart:convert';
import 'package:codeedexmt/core/constants/api_endpoints.dart';
import 'package:codeedexmt/data/models/category_model.dart';
import 'package:codeedexmt/data/models/product_model.dart';
import 'package:http/http.dart' as http;

Future<void> loginUser(String email, String password) async {
  final url = Uri.parse(ApiEndpoints.loginUrl);

  final response = await http.post(
    url,
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      "email": "john@mail.com",
      "password": "changeme",
    }),
  );

  if (response.statusCode == 201) {
    print("Login successful: ${response.body}");
  } else {
    print("Failed to login: ${response.statusCode}");
    print("Error: ${response.body}");
  }
}

Future<List<Part>> fetchProducts() async {
  final url = Uri.parse(ApiEndpoints.productUrl);

  final response = await http.get(
    url,
  );

  if (response.statusCode == 200) {
    print("products successful: ${response.body}");

    final List<dynamic> responseData = jsonDecode(response.body);
    List<Part> products =
        responseData.map((json) => Part.fromJson(json)).toList();
    return products;
  } else {
    print("Failed to fetch products: ${response.statusCode}");
    throw Exception("Failed to load products");
  }
}

Future<List<Category>> fetchCategories() async {
  final url = Uri.parse(ApiEndpoints.categoryUrl);

  final response = await http.get(url);

  if (response.statusCode == 200) {
    print("Categories fetched successfully: ${response.body}");

    final List<dynamic> responseData = jsonDecode(response.body);
    List<Category> categories =
        responseData.map((json) => Category.fromJson(json)).toList();
    return categories;
  } else {
    print("Failed to fetch categories: ${response.statusCode}");
    throw Exception("Failed to load categories");
  }
}
