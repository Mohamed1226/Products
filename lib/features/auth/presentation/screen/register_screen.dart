import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_structure/core/di/locator.dart';
import 'package:ready_structure/core/services/navigation.dart';
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
import 'package:ready_structure/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ready_structure/features/auth/presentation/screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends AppScreen<RegisterScreen, AuthCubit> {
  final key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget content() {
    return BlocBuilder<AuthCubit, ResourceState>(
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
                          Text(
                            "register screen",
                            style: Styles.font12PrimaryColorWeight700(
                                fontWeight: AppFontWeight.weight_700,
                                fontSize: AppFontSize.fontSize_16),
                          ),
                          SizedBox(height: 24.h),
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
                          SizedBox(height: 18.h),
                          AppTextFormField(
                              label: "your password",
                              controller: passwordController,
                              validators: [RequiredValidator()]),
                          SizedBox(height: 24.h),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: 'Already have account',
                              style: Styles.font12PrimaryColorWeight700(),
                            ),
                            TextSpan(
                              text: ' login',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => locator<NavigationService>()
                                    .pushAndRemoveUntil(const LoginScreen()),
                              style: Styles.font12PrimaryColorWeight700(
                                  color: AppFixedColors.openGreen),
                            ),
                          ])),
                          SizedBox(height: 24.h),
                          AppPrimaryButton(
                            text: "register",
                            textColor: AppFixedColors.white,
                            onPressed: () {
                              if (key.currentState!.validate()) {
                                cubit.register(
                                    user: UserModel(
                                        email: emailController.text,
                                        name: nameController.text,
                                        password: passwordController.text));
                              }
                            },
                          )
                        ]),
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  onInitState() {}
}
