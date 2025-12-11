// import 'package:auth_feature_1_0/Conenction/cubit/test_network_cubit.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/scheduler.dart';

// class NetworkCheckerBody extends StatefulWidget {
//   final Widget body;
//   const NetworkCheckerBody({super.key, required this.body});

//   @override
//   State<NetworkCheckerBody> createState() => _NetworkCheckScreenState();
// }

// class _NetworkCheckScreenState extends State<NetworkCheckerBody> {
//   late TestNetworkCubit cubit;

//   @override
//   void initState() {
//     super.initState();
//     cubit = TestNetworkCubit();
//     //  بيعمل ريبلد بعد ما يتسعدي التايمر لاين عشان ميحصلش مشاكل مع الcontext
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       cubit.testConnection();
//     });
//   }

//   @override
//   void dispose() {
//     cubit.close();
//     super.dispose();
//   }

//   void showStatusSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: cubit,
//       child: Scaffold(
//         body: BlocListener<TestNetworkCubit, TestNetworkState>(
//           listener: (context, state) {
//             showStatusSnackBar(cubit.status);
//           },
//           child: RefreshIndicator(
//             onRefresh: () async {
//               await cubit.testConnection();
//               await context.read<GetCommentCubit>().getCommentFromCubit(
//                 Url: paseUrlProduct,
//               );
//             },
//             child: Container(child: widget.body),
//           ),
//         ),
//       ),
//     );
//   }
// }
