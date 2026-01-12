import 'package:auth_feature_1_0/core/Conenction/cubit/test_network_cubit.dart';
import 'package:auth_feature_1_0/core/locator/locatorApp.dart';
import 'package:auth_feature_1_0/features/layout_feature/pressentation/viewmodel/cubit/product_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkCheckerBody extends StatefulWidget {
  const NetworkCheckerBody({
    super.key,
    required this.scaffold,
    required this.Url,
  });
  final Widget scaffold;
  final String Url;

  @override
  State<NetworkCheckerBody> createState() => _NetworkCheckScreenState();
}

class _NetworkCheckScreenState extends State<NetworkCheckerBody> {
  late TestNetworkCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = gtit<TestNetworkCubit>();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  void showStatusSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => gtit<ProductCubit>(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          // if (state is FailuerNetwork) {
          //   showStatusSnackBar(state.mass);
          // } else if (state is DoneNetwork) {
          //   showStatusSnackBar("Data Loaded");
          // }
        },

        builder: (context, state) {
          // final cubit = context.read<TestNetworkCubit>();
          return RefreshIndicator(
            onRefresh: () async {
              // await cubit.testConnection();
              context.read<ProductCubit>().fetchProducts(widget.Url);
            },
            child: widget.scaffold,
          );
        },
      ),
    );
  }
}
