import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:ready_structure/core/theming/colors/colors_manager.dart';

import 'app_loader_widget.dart';

class LoadingOverlayWidget extends StatelessWidget {
  final bool isLoading;
  final Widget? loader;
  final String? loadingComment;
  final Widget child;

  const LoadingOverlayWidget(
      {Key? key,
      required this.isLoading,
      required this.child,
      this.loader,
      this.loadingComment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurryModalProgressHUD(
      inAsyncCall: isLoading,
      blurEffectIntensity: 2.0,
      color: AppFixedColors.black.withOpacity(0.24),
      dismissible: false,
      progressIndicator: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          loader ??
              const AppLoaderWidget(
                // loadingComment: loadingComment,
                loaderSize: LoaderSize.Normal,
                // color: AppColors.primaryColor.withOpacity(0.5),
              ),
          // if (loadingComment != null)
          //   Material(
          //       color: Colors.transparent,
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 40.pw, vertical: 24.ph),
          //         child: Text(
          //           loadingComment!,
          //           style: TextStyle(
          //             fontSize: AppFontSize.fontSize_16,
          //             fontWeight: AppFontWeight.weight_600,
          //             color: AppColors.dark1,
          //           ),
          //         ),
          //       )),
        ],
      ),
      // opacity: 0.36,
      child: child,
    );
  }
}
