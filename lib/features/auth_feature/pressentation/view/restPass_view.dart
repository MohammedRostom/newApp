import 'package:auth_feature_1_0/config/routes/app_views.dart';
import 'package:auth_feature_1_0/config/routes/routers.dart';
import 'package:auth_feature_1_0/core/Constant.dart';
import 'package:auth_feature_1_0/core/components/CustomFillBtn.dart';
import 'package:auth_feature_1_0/core/components/ScreenBodyWiteMargain.dart';
import 'package:auth_feature_1_0/core/components/customTextFormField.dart';
import 'package:auth_feature_1_0/core/components/fillWidthCont.dart';
import 'package:auth_feature_1_0/core/locator/locatorApp.dart';
import 'package:auth_feature_1_0/core/utils/app_Color.dart';
import 'package:auth_feature_1_0/features/auth_feature/pressentation/viewmodel/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _LoginViewState();
}

class _LoginViewState extends State<ResetPasswordView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  // 🔹 Validation Methods
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email is required";
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) return "Enter a valid email";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => gtit<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthRestPass) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("check your email to reset your password "),
                duration: Duration(seconds: 3),
                backgroundColor: Colors.green,
              ),
            );
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    Icon(Icons.warning_amber_outlined),
                    Text(state.errorMessage),
                  ],
                ),
                duration: Duration(seconds: 4),
                backgroundColor: const Color.fromARGB(255, 234, 102, 20),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubitAuthController = context.read<AuthCubit>();

          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: ScreenBodyWiteMargain(
              widget: Container(
                width: Constant.fillContainerWidth(context),
                child: Column(
                  children: [
                    SpaceBetweenSections(spaceHeight: 20.h),
                    _Header(state: state),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              CustomTextFormField(
                                controller: _emailController,
                                hintText: "Email",
                                prefixIcon: Icons.email,
                                keyboardType: TextInputType.emailAddress,
                                validator: _validateEmail,
                              ),

                              SpaceBetweenSections(spaceHeight: 20.h),
                              CustomFillBtn(
                                isloding: state is AuthLoading ? true : false,
                                btnText: "Send",
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await _onResetPasswordButtonPressed(
                                      cubitAuthController,
                                      context,
                                      email: _emailController.text,
                                    );
                                  }
                                },
                              ),
                              SpaceHeightBetweenElements(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

_onResetPasswordButtonPressed(
  AuthCubit authCubit,
  context, {
  required String email,
}) async {
  await authCubit.restPass(email);
  final CurrntState = authCubit.state;
  if (CurrntState is AuthCHeckNet && !CurrntState.isHasInternet) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.wifi_off_outlined, color: Colors.white),
            SizedBox(width: 4.w),
            Text("No internet connection"),
          ],
        ),
        duration: Duration(seconds: 4),
        backgroundColor: Colors.red,
        action: SnackBarAction(
          textColor: Colors.white,
          label: "Try Again",
          onPressed: () =>
              _onResetPasswordButtonPressed(authCubit, context, email: email),
        ),
      ),
    );
  }
}

// 🔹 Header Widget
class _Header extends StatelessWidget {
  final state;
  const _Header({required this.state});

  @override
  Widget build(BuildContext context) {
    return FullWidthContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.popAndPushNamed(context, loginRoute),
          ),
          Text(
            "Reset Password ",
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              if (state is AuthLoading)
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColor.primarycolor,
                  ),
                ),

              Expanded(
                child: Text(
                  "Enter your email address below ",
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
              ),
            ],
          ),
          SpaceHeightBetweenElements(),
        ],
      ),
    );
  }
}
