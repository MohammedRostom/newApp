import 'package:auth_feature_1_0/core/Constant.dart';
import 'package:auth_feature_1_0/core/locator/locatorApp.dart';
import 'package:auth_feature_1_0/core/utils/app_Color.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';
import 'package:auth_feature_1_0/features/layout_feature/pressentation/viewmodel/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Layout extends StatelessWidget {
  Layout({super.key});

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as AuthUserEntity;
    return BlocProvider(
      create: (context) => gtit<ProductCubit>(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          final cubit = context.read<ProductCubit>();

          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              selectedIconTheme: IconThemeData(color: AppColor.primarycolor),
              selectedItemColor: AppColor.primarycolor,
              unselectedItemColor: Colors.grey,
              currentIndex: state is Changeindex ? state.index : 0,
              onTap: (index) {
                cubit.changeIndexPage(index);
              },
              items: List.generate(
                Constant.Taps.length,
                (index) => BottomNavigationBarItem(
                  icon: Constant.Taps[index]["Icon"],
                  label: Constant.Taps[index]["label"],
                ),
              ),
            ),
            //  احسن من البيجد فيو
            body: IndexedStack(
              index: state is Changeindex ? state.index : 0,
              children: Constant.layoutPages,
            ),
          );
        },
      ),
    );
  }
}
