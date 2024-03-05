import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_structure/core/app_localization/app_localization.dart';
import 'package:ready_structure/core/theming/colors/colors_manager.dart';
import 'package:ready_structure/features/products/data/model/product_model.dart';

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

  Container buildProductCard(BuildContext context, Product product, int index) {
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
          FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  product.image,
                  height: 100.h,
                  width: MediaQuery.of(context).size.width,
                ),
                const SizedBox(
                  height: 10,
                ),
                buildProductTitle(product),
                FittedBox(child: buildProductPrice(product)),
                const SizedBox(
                  height: 10,
                ),
                FittedBox(child: buildProductCategory(context, product)),
                const SizedBox(
                  height: 10,
                ),
                FittedBox(child: buildProductRate(context, product)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildProductCategory(BuildContext context, Product model) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      decoration: BoxDecoration(
        color: AppFixedColors.secondaryColor1,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            "category: ",
          ),
          Text(
            "${model.category}",
          )
        ],
      ),
    );
  }

  Container buildProductRate(BuildContext context, Product model) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      decoration: BoxDecoration(
        color: AppFixedColors.secondaryColor1,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            "Rate: ",
          ),
          Text(
            "${model.rate.rate}",
          )
        ],
      ),
    );
  }

  Widget buildProductPrice(Product model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Price :",
        ),
        Text(
          "${model.price}",
        ),
      ],
    );
  }

  Align buildProductTitle(Product model) {
    return Align(
      alignment:
          AppLocalize.isArabic ? Alignment.centerRight : Alignment.centerLeft,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            model.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
