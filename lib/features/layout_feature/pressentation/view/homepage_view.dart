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
import 'package:flutter/material.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    return NetworkCheckerBody(
      scaffold: Scaffold(
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Item ItemItemItemItemItemItemItemItem $index'),
            );
          },
        ),
      ),
    );
  }
}
