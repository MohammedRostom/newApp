import 'package:auth_feature_1_0/config/routes/app_routes.dart';
import 'package:auth_feature_1_0/core/Constant.dart';
import 'package:auth_feature_1_0/core/components/CustomFillBtn.dart';
import 'package:auth_feature_1_0/core/components/ScreenBodyWiteMargain.dart';
import 'package:auth_feature_1_0/core/components/customTextFormField.dart';
import 'package:auth_feature_1_0/core/components/fillWidthCont.dart';
import 'package:auth_feature_1_0/core/locator/locatorApp.dart';
import 'package:auth_feature_1_0/features/auth_feature/pressentation/viewmodel/cubit/auth_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewViewState();
}

class _SignupViewViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _userController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _rePasswordController;

  @override
  void initState() {
    super.initState();
    _userController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _userController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
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

  String? _validateConfirmPassword(String? value) {
    if (value != _passwordController.text) return "Passwords do not match";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // =========================================================
    return BlocProvider(
      create: (context) => LoactorApp.sl<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthDone) {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                duration: Duration(seconds: 4),
                backgroundColor: const Color.fromARGB(255, 222, 222, 222),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubitAuthController = context.read<AuthCubit>();
          //

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
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1zPVlhIigbYWt6a2kHdKo0iVN_ibkTlSF5A&s",
                      ),
                    ),

                    // 🔹 Form Section
                    Expanded(
                      flex: 4,
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
                                      controller: _userController,
                                      hintText: "User Name",
                                      prefixIcon: Icons.person,
                                      validator: (value) =>
                                          value == null || value.isEmpty
                                          ? "User name is required"
                                          : null,
                                    ),
                                    SpaceHeightBetweenElements(),
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
                                    CustomTextFormField(
                                      controller: _rePasswordController,
                                      hintText: "Confirm Password",
                                      prefixIcon: Icons.lock,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      obscureText: true,
                                      validator: _validateConfirmPassword,
                                    ),
                                    SpaceBetweenSections(spaceHeight: 20.h),
                                    CustomFillBtn(
                                      isloding: state is AuthLoading
                                          ? true
                                          : false,
                                      btnText: "Register",
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          _signupButtonPressed(
                                            cubitAuthController,
                                            context,
                                            username: _userController.text
                                                .trim(),
                                            email: _emailController.text.trim(),
                                            Pass: _passwordController.text
                                                .trim(),
                                          );
                                        }
                                      },
                                    ),
                                    SpaceHeightBetweenElements(),
                                    _LoginRedirect(),
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

_signupButtonPressed(
  AuthCubit authCubit,
  context, {
  required String username,
  required String email,
  required String Pass,
}) async {
  await authCubit.signupUser(username, email, Pass);

  final CurrntState = authCubit.state;
  if (CurrntState is AuthCHeckNet && !CurrntState.isHasInternet) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("No internet connection"),
        duration: Duration(seconds: 4),
        backgroundColor: Colors.red,
        action: SnackBarAction(
          textColor: Colors.white,
          label: "Try Again",
          onPressed: () => _signupButtonPressed(
            username: username,
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
    String message;

    message = "Create An Account ";

    Color messageColor = state is AuthError ? Colors.red : Colors.grey.shade600;

    return FullWidthContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign up",
            style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              if (state is AuthLoading)
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(fontSize: 14.sp, color: messageColor),
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

// 🔹 Login Redirect Widget
class _LoginRedirect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account? ", style: TextStyle(fontSize: 14.sp)),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, AppRoutes.login),
          child: Text(
            "Login",
            style: TextStyle(fontSize: 14.sp, color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
