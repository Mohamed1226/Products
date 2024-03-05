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
import 'package:ready_structure/features/products/presentation/screen/products_favourite_screen.dart';
import 'package:ready_structure/features/products/presentation/widget/products_list_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends AppScreen<ProductsScreen, ProductCubit> {
  @override
  Widget content() {
    return BlocBuilder<ProductCubit, ResourceState>(
      bloc: cubit,
      builder: (context, state) {
        return LoadingOverlayWidget(
          isLoading: state is LoadingResource,
          child: Scaffold(
            appBar: productsAppBar(),
            drawer: productsDrawer(),
            floatingActionButton: FloatingActionButton(
                backgroundColor: AppFixedColors.primaryColor,
                onPressed: () {
                  context.navigateByWidget(const ProductsFavouriteScreen());
                },
                child: const Icon(Icons.favorite)),
            body: SingleChildScrollView(
                child: SizedBox(
              height: height,
              child: Column(
                children: [
                  ProductsListWidget(products: cubit.products),
                ],
              ),
            )),
          ),
        );
      },
    );
  }

  AppBar productsAppBar() {
    return AppBar(
        title: const Text("Products list"),
        backgroundColor: AppFixedColors.primaryColor);
  }

  Drawer productsDrawer() {
    return Drawer(
      child: TextButton(
        onPressed: () {
          locator<AuthCubit>().logOut();
        },
        child: Text(
          "logout",
          style: Styles.font12PrimaryColorWeight700(),
        ),
      ),
    );
  }

  @override
  onInitState() {
    cubit.getProducts();
  }
}
