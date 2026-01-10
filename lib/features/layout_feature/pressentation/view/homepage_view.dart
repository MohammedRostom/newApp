// import 'package:auth_feature_1_0/core/locator/locatorApp.dart';
// import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';
// import 'package:auth_feature_1_0/features/auth_feature/pressentation/viewmodel/cubit/auth_cubit.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomepageView extends StatelessWidget {
//   const HomepageView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final args =
//         ModalRoute.of(context)!.settings.arguments
//             as AuthUserEntity; // dynamic type
//     return Scaffold(
//       appBar: AppBar(title: const Text('Homepage')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Username :${args.username}',
//               style: const TextStyle(fontSize: 18),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Email: ${args.email}',
//                   style: const TextStyle(fontSize: 13),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     // نسخ البريد الإلكتروني إلى الحافظة
//                     Clipboard.setData(ClipboardData(text: args.email));
//                     // إظهار رسالة تأكيد
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Email copied to clipboard'),
//                       ),
//                     );
//                   },
//                   child: const Icon(Icons.copy, size: 16),
//                 ),
//                 BlocProvider(
//                   create: (context) => gtit<AuthCubit>(),
//                   child: BlocConsumer<AuthCubit, AuthState>(
//                     listener: (context, state) {
//                       // TODO: implement listener
//                     },
//                     builder: (context, state) {
//                       final cubit = context.read<AuthCubit>();
//                       final isEmailVerified =
//                           FirebaseAuth.instance.currentUser!.emailVerified;

//                       return GestureDetector(
//                         onTap: () async {
//                           await cubit.confirmEmail();
//                         },
//                         child: Icon(
//                           Icons.verified,
//                           size: 16,
//                           color: isEmailVerified ? Colors.green : Colors.grey,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Text('ID: ${args.id}', style: const TextStyle(fontSize: 18)),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:auth_feature_1_0/core/Conenction/NetworkCheckeRefrechBody.dart';
import 'package:auth_feature_1_0/core/Constant.dart';
import 'package:auth_feature_1_0/core/locator/locatorApp.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/entitity/user_entity.dart';
import 'package:auth_feature_1_0/features/layout_feature/pressentation/viewmodel/cubit/product_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomepageView extends StatefulWidget {
  const HomepageView({super.key});

  @override
  State<HomepageView> createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  late ProductCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = gtit<ProductCubit>();
    cubit.fetchProducts(Constant.getAllProductsUrl);
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  Widget build(BuildContext context) {
    // final args =
    // ModalRoute.of(context)!.settings.arguments
    //     as AuthUserEntity; // dynamic type
    return BlocProvider(
      create: (context) => gtit<ProductCubit>(),
      child: NetworkCheckerBody(
        Url: Constant.getAllProductsUrl,
        scaffold: Scaffold(
          appBar: AppBar(
            title: Text("args.username!"),
            actions: [IconButton(onPressed: null, icon: Icon(Icons.person))],
          ),
          body: BlocConsumer<ProductCubit, ProductState>(
            listener: (context, state) {
              // if (state is ProductsInitial) {
              //   Center(child: CircularProgressIndicator());
              // }
              // if (state is CHeckNet && !state.isHasInternet) {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(
              //       content: Row(
              //         children: [
              //           Icon(Icons.wifi_off_outlined, color: Colors.white),
              //           SizedBox(width: 4.w),
              //           Text("No internet connection"),
              //         ],
              //       ),
              //       duration: Duration(seconds: 4),
              //       backgroundColor: Colors.red,
              //       action: SnackBarAction(
              //         textColor: Colors.white,
              //         label: "Try Again",
              //         onPressed: () => gtit<ProductCubit>().fetchProducts(
              //           Constant.getAllProductsUrl,
              //         ),
              //       ),
              //     ),
              //   );
              // }
            },
            builder: (context, state) {
              final cubit = context.read<ProductCubit>();

              if (state is CHeckNet && !state.isHasInternet) {
                return Center(
                  child: Column(
                    children: [
                      Text("💔 No internet "),
                      TextButton(
                        onPressed: () =>
                            cubit..fetchProducts(Constant.getAllProductsUrl),
                        child: Text("Refrach"),
                      ),
                    ],
                  ),
                );
              }
              if (state is ProductsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductsLoaded) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        color: Colors.grey[300],
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(30),
                              child: CachedNetworkImage(
                                placeholder: (context, url) => Container(
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(),
                                ),
                                fit: BoxFit.cover,
                                imageUrl: state.products[index]!.image,
                              ),
                            ),
                            Text(
                              softWrap: true,
                              maxLines: 1,
                              state.products[index]!.title.toString(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              // if (state is ProductsLoadedError) {
              //  show pop up error
              // showDialog(
              //   context: context,
              //   builder: (context) {
              //     return AlertDialog(
              //       title: const Text('LoadedError'),
              //       content: Text("${state.message} "),
              //       actions: [
              //         TextButton(
              //           onPressed: () async {
              //             Navigator.pop(context);
              //             await context.read<ProductCubit>().fetchProducts(
              //               Constant.getAllProductsUrl,
              //             );
              //           },
              //           child: const Text('Try Again'),
              //         ),
              //       ],
              //     );
              //   },
              // );
              // return Text("Error");
              // }
              else {
                return Center(
                  child: TextButton(
                    onPressed: () =>
                        cubit.fetchProducts(Constant.getAllProductsUrl),
                    child: Text("Refrech Try Now?"),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
