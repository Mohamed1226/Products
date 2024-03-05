import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_structure/core/di/locator.dart';
import 'package:ready_structure/core/shared_prefs/app_shared_prefs.dart';
import 'package:ready_structure/core/theming/colors/colors_manager.dart';
import 'package:ready_structure/core/theming/styles/fonts.dart';
import 'package:ready_structure/core/ui/loader/loading_widget.dart';
import 'package:ready_structure/core/ui/screen/app_statefull.dart';
import 'package:ready_structure/core/ui/state/cubit_state.dart';
import 'package:ready_structure/core/ui/widgets/app_primary_button.dart';
import 'package:ready_structure/core/ui/widgets/app_text_field.dart';
import 'package:ready_structure/core/validators/email_validator.dart';
import 'package:ready_structure/core/validators/required_validators.dart';
import 'package:ready_structure/features/auth/data/model/user_model.dart';
import 'package:ready_structure/features/user/presentation/screen/cubit/user_cubit.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends AppScreen<UserScreen, UserCubit> {
  final key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  late UserModel user;

  @override
  Widget content() {
    return Scaffold(
        appBar: AppBar(
          title: const Text("user Profile"),
          backgroundColor: AppFixedColors.primaryColor,
        ),
        body: BlocBuilder<UserCubit, ResourceState>(
          bloc: cubit,
          builder: (context, state) {
            return LoadingOverlayWidget(
              isLoading: state is LoadingResource,
              child: Scaffold(
                body: Form(
                  key: key,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: 180.0.h) +
                          EdgeInsets.symmetric(horizontal: 18.w),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 50.h),
                            AppTextFormField(
                              label: "your name",
                              controller: nameController,
                              validators: [RequiredValidator()],
                            ),
                            SizedBox(height: 18.h),
                            AppTextFormField(
                                label: "your email",
                                controller: emailController,
                                validators: [
                                  RequiredValidator(),
                                  EmailValidator()
                                ]),
                            SizedBox(height: 24.h),
                            AppPrimaryButton(
                              text: "Save",
                              textColor: AppFixedColors.white,
                              onPressed: () {
                                if (key.currentState!.validate()) {
                                  cubit.saveUserLocal(UserModel(
                                      email: emailController.text,
                                      name: nameController.text));
                                }
                              },
                            )
                          ]),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }

  @override
  onInitState() {
    initValues();
  }

  void initValues() {
    user = locator<AppSharedPrefs>().getUser();
    emailController.text = user.email;
    nameController.text = user.name;
  }
}
