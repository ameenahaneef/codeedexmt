import 'package:codeedexmt/core/constants/app_colors.dart';
import 'package:codeedexmt/core/constants/app_styles.dart';
import 'package:codeedexmt/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final Part product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kWhite),
        backgroundColor: Colors.black,
        title: Text(
          product.partsName ?? 'Product Details',
          style: style1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/images.png',
                  image: product.partImage,
                  height: 250,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/images.jpg',
                      fit: BoxFit.cover,
                      height: 150,
                    );
                  }),
            ),
            const SizedBox(height: 16),
            Text(
              product.partsName ?? 'Unnamed Product',
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: kWhite),
            ),
            const SizedBox(height: 8),
            Text(
              'Price: \$${product.price}',
              style: const TextStyle(fontSize: 20, color: kGreen),
            ),
            const SizedBox(height: 16),
            Text(
              product.description,
              style: const TextStyle(fontSize: 18, color: kWhite),
            ),
            Text(
              'Rating:${product.productRating}',
              style: const TextStyle(fontSize: 14, color: kWhite),
            )
          ],
        ),
      ),
    );
  }
}
