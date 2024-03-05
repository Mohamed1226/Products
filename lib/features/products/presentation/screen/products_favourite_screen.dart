import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready_structure/core/di/locator.dart';
import 'package:ready_structure/core/helpers/extensions/context_extensions.dart';
import 'package:ready_structure/core/theming/colors/colors_manager.dart';
import 'package:ready_structure/core/theming/styles/fonts.dart';
import 'package:ready_structure/core/ui/loader/loading_widget.dart';
import 'package:ready_structure/core/ui/screen/app_statefull.dart';
import 'package:ready_structure/core/ui/state/cubit_state.dart';
import 'package:ready_structure/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ready_structure/features/products/presentation/cubit/product_cubit.dart';
import 'package:ready_structure/features/products/presentation/widget/products_list_widget.dart';

class ProductsFavouriteScreen extends StatefulWidget {
  const ProductsFavouriteScreen({super.key});

  @override
  State<ProductsFavouriteScreen> createState() =>
      _ProductsFavouriteScreenState();
}

class _ProductsFavouriteScreenState
    extends AppScreen<ProductsFavouriteScreen, ProductCubit> {
  @override
  Widget content() {
    return BlocBuilder<ProductCubit, ResourceState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: productsAppBar(),
          body: SingleChildScrollView(
              child: SizedBox(
            height: height,
            child: Column(
              children: [
                ProductsListWidget(products: cubit.favouriteProducts),
              ],
            ),
          )),
        );
      },
    );
  }

  AppBar productsAppBar() {
    return AppBar(
        title: const Text("Products list"),
        backgroundColor: AppFixedColors.primaryColor);
  }

  @override
  onInitState() {
    cubit.getProducts();
  }
}
