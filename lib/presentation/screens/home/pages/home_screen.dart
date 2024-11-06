import 'package:codeedexmt/core/constants/app_colors.dart';
import 'package:codeedexmt/presentation/providers/category_provider.dart';
import 'package:codeedexmt/presentation/providers/product_provider.dart';
import 'package:codeedexmt/presentation/screens/home/widgets/category_tab.dart';
import 'package:codeedexmt/presentation/screens/home/widgets/drawer.dart';
import 'package:codeedexmt/presentation/screens/home/widgets/product_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CategoryProvider>(context, listen: false).category();
      Provider.of<ProductProvider>(context, listen: false).product();
    });
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kBlack,
        appBar: AppBar(
          backgroundColor: kBlack,
          iconTheme: const IconThemeData(color: kWhite),
          title: const Text(
            'Home Screen',
            style: TextStyle(color: kWhite),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Products'),
              Tab(text: 'Categories'),
            ],
            labelColor: Colors.cyan,
            unselectedLabelColor: kWhite,
          ),
        ),
        drawer: const Drawers(),
        body: const TabBarView(
          children: [
            ProductTab(),
            CategoryTab(),
          ],
        ),
      ),
    );
  }
}
