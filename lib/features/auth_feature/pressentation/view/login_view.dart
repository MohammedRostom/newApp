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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // 🔹 Validation Methods
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email is required";
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) return "Enter a valid email";
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Password is required";
    if (value.length < 6) return "Password must be at least 6 chars";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => gtit<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthDone) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(" Login Successful"),
                duration: Duration(seconds: 3),
                backgroundColor: Colors.green,
              ),
            );

            Future.delayed(Duration(seconds: 2), () {
              Navigator.pushReplacementNamed(
                context,
                homePageRoute,
                arguments: state.userEntity,
              );
            });
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
                    // 🔹 Header Image
                    Expanded(
                      flex: 2,
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://cdni.iconscout.com/illustration/premium/thumb/login-security-illustration-svg-download-png-7271013.png",
                      ),
                    ),
                    // 🔹 Form Section
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
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
                                    SpaceHeightBetweenElements(),
                                    CustomTextFormField(
                                      controller: _passwordController,
                                      hintText: "Password",
                                      prefixIcon: Icons.lock,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      obscureText: true,
                                      validator: _validatePassword,
                                    ),
                                    SpaceHeightBetweenElements(),
                                    GestureDetector(
                                      onTap: () =>
                                          Navigator.pushReplacementNamed(
                                            context,
                                            resetPasswordRoute,
                                          ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Forget Password?",
                                            style: TextStyle(
                                              decorationColor:
                                                  AppColor.primarycolor,

                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 14.sp,
                                              color: AppColor.primarycolor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SpaceHeightBetweenElements(),
                                    CustomFillBtn(
                                      isloding: state is AuthLoading
                                          ? true
                                          : false,
                                      btnText: "Login",
                                      onTap: () async {
                                        if (_formKey.currentState!.validate()) {
                                          await _onLoginButtonPressed(
                                            cubitAuthController,
                                            context,
                                            email: _emailController.text,
                                            Pass: _passwordController.text,
                                          );
                                        }
                                      },
                                    ),
                                    SpaceHeightBetweenElements(),
                                    _SignupRedirect(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
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

_onLoginButtonPressed(
  AuthCubit authCubit,
  context, {
  required String email,
  required String Pass,
}) async {
  await authCubit.loginUser(email, Pass);
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
          onPressed: () => _onLoginButtonPressed(
            authCubit,
            context,
            email: email,
            Pass: Pass,
          ),
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
          Text(
            "Login",
            style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
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
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Please login to continue",
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

// 🔹 Signup Redirect Widget
class _SignupRedirect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Create an account? ", style: TextStyle(fontSize: 14.sp)),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, signupRoute),
          child: Text(
            "Sign up",
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.red,
              decorationColor: AppColor.primarycolor,

              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
