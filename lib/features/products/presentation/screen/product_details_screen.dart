import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_structure/core/theming/colors/colors_manager.dart';
import 'package:ready_structure/core/ui/screen/app_statefull.dart';
import 'package:ready_structure/features/products/data/model/product_model.dart';
import 'package:ready_structure/features/products/presentation/cubit/product_cubit.dart';
import 'package:ready_structure/features/products/presentation/widget/build_desc_widget.dart';
import 'package:ready_structure/features/products/presentation/widget/build_row_container_widget.dart';
import 'package:ready_structure/features/products/presentation/widget/build_row_widget.dart';
import 'package:ready_structure/features/products/presentation/widget/build_title_widget.dart';

class ProductsDetailsScreen extends StatefulWidget {
  const ProductsDetailsScreen({super.key, required this.product});

  final Product product;

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState
    extends AppScreen<ProductsDetailsScreen, ProductCubit> {
  @override
  Widget content() {
    return Scaffold(
      appBar: productsAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppFixedColors.primaryColor,
        child: Icon(
            widget.product.isFavourite ? Icons.favorite : Icons.diamond_sharp),
        onPressed: () {
          if (widget.product.isFavourite) {
            cubit.removeFromFavouriteList(widget.product);
          } else {
            cubit.addToFavouriteList(widget.product);
          }
          setState(() {});
        },
      ),
      body: SingleChildScrollView(child: buildProductCard(widget.product)),
    );
  }

  Container buildProductCard(Product product) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.only(bottom: 12, right: 8, left: 8, top: 8),
      decoration: BoxDecoration(
        color: AppFixedColors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: product.id,
                child: Image.network(
                  product.image,
                  height: 300.h,
                  width: width,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BuildTitleWidget(title: product.title),
              BuildDescWidget(description: product.description),
              FittedBox(
                  child: BuildRowWidget(
                title: "Price :",
                value: product.price.toString(),
              )),
              const SizedBox(
                height: 10,
              ),
              FittedBox(
                  child: BuildRowContainerWidget(
                title: "category: ",
                value: product.category,
              )),
              const SizedBox(
                height: 10,
              ),
              FittedBox(
                  child: BuildRowContainerWidget(
                title: "Rate: ",
                value: product.rate.rate.toString(),
              )),
              const SizedBox(
                height: 10,
              ),
              FittedBox(
                  child: BuildRowContainerWidget(
                title: "count for rate: ",
                value: product.rate.count.toString(),
              )),
            ],
          ),
        ],
      ),
    );
  }

  AppBar productsAppBar() {
    return AppBar(
        title: const Text("Products details list"),
        backgroundColor: AppFixedColors.primaryColor);
  }

  @override
  onInitState() {
    cubit.getProducts();
  }
}
