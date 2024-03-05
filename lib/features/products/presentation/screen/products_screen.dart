import 'package:flutter/cupertino.dart';
import 'package:ready_structure/core/ui/screen/app_statefull.dart';
import 'package:ready_structure/features/products/presentation/cubit/product_cubit.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends AppScreen<ProductsScreen, ProductCubit> {
  @override
  Widget content() {
    return Container();
  }

  @override
  onInitState() {
    cubit.getProducts();
  }
}
