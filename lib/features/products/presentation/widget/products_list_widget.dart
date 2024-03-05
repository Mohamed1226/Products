import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_structure/core/helpers/extensions/context_extensions.dart';
import 'package:ready_structure/core/theming/colors/colors_manager.dart';
import 'package:ready_structure/features/products/data/model/product_model.dart';
import 'package:ready_structure/features/products/presentation/screen/product_details_screen.dart';
import 'package:ready_structure/features/products/presentation/widget/build_row_container_widget.dart';
import 'package:ready_structure/features/products/presentation/widget/build_row_widget.dart';
import 'package:ready_structure/features/products/presentation/widget/build_title_widget.dart';

class ProductsListWidget extends StatefulWidget {
  const ProductsListWidget({
    Key? key,
    required this.products,
  }) : super(key: key);
  final List<Product> products;

  @override
  _ProductsListWidgetState createState() => _ProductsListWidgetState();
}

class _ProductsListWidgetState extends State<ProductsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: widget.products.length,
          itemBuilder: (context, index) {
            Product model = widget.products[index];
            return buildProductCard(context, model, index);
          }),
    );
  }

  InkWell buildProductCard(BuildContext context, Product product, int index) {
    return InkWell(
      onTap: () {
        context.navigateByWidget(ProductsDetailsScreen(
          product: product,
        ));
      },
      child: Container(
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
            FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: product.id,
                    child: Image.network(
                      product.image,
                      height: 100.h,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BuildTitleWidget(title: product.title),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
