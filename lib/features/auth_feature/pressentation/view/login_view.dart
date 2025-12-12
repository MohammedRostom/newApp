import 'package:auth_feature_1_0/core/locator/locatorApp.dart';
import 'package:auth_feature_1_0/features/auth_feature/pressentation/viewmodel/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: BlocProvider(
        create: (context) => LocatorApp.sl<AuthCubit>(),
        child: Center(
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final authCubit = context.read<AuthCubit>();

              return Column(
                children: [
                  TextButton.icon(
                    icon: state is AuthCHeckNet
                        ? state.isHasInternet
                              ? Icon(Icons.wifi)
                              : Icon(Icons.error)
                        : Icon(Icons.error),
                    label: Text(
                      state is AuthCHeckNet && !state.isHasInternet
                          ? "No Internet"
                          : state is AuthInitial
                          ? "Test Net"
                          : state is AuthDone
                          ? "Logged In"
                          : "Good Internet",
                    ),
                    onPressed: () => _onLoginButtonPressed(authCubit, context),
                  ),
                  Text(
                    state is AuthCHeckNet && state.isHasInternet == false
                        ? "No internet connection"
                        : state is AuthDone
                        ? "Logged in successfully"
                        : state is AuthInitial
                        ? "Test internet connection"
                        : "Good internet connection",
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  _onLoginButtonPressed(AuthCubit authCubit, context) async {
    await authCubit.loginUser('aborustom40@gmail.com', 'aborustom40@gmail.com');

    final CurrntState = authCubit.state;
    if (CurrntState is AuthCHeckNet && !CurrntState.isHasInternet) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("❌No internet connection"),
          duration: Duration(seconds: 4),
          action: SnackBarAction(
            label: "Try Again",
            onPressed: () => _onLoginButtonPressed(authCubit, context),
          ),
        ),
      );
    }
  }
}
