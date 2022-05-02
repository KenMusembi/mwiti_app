// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:fundi254_mobile/controllers/authentication/login_controller.dart';
// import 'package:fundi254_mobile/controllers/general/get_categories_controller.dart';
// import 'package:fundi254_mobile/controllers/wallet/get_transaction_history.dart';
// import 'package:fundi254_mobile/models/general/get_categories_model.dart';
// import 'package:fundi254_mobile/models/wallet/transaction_history_model.dart';
// import 'package:fundi254_mobile/res/custom_colors.dart';
// import 'package:fundi254_mobile/widgets/bottomsheet_container.dart';
// import 'package:fundi254_mobile/widgets/buttonloader.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class WalletScreen extends StatefulWidget {
//   const WalletScreen({Key? key}) : super(key: key);

//   @override
//   State<WalletScreen> createState() => _WalletScreenState();
// }

// class _WalletScreenState extends State<WalletScreen> {
//   LoginController controller = Get.put(LoginController());
//   GetWalletTransactionsController walletController =
//       Get.put(GetWalletTransactionsController());

//   @override
//   void setState(VoidCallback fn) async {
//     super.setState(fn);
//   }

//   var walletDetails = WalletData();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color(0xffffffff),
//         appBar: AppBar(
//           backgroundColor: const Color(0xff0051A2),
//           title: const Center(child: Text('Fundi254')),
//           actions: [
//             IconButton(
//                 onPressed: () async {
//                   final prefs = await SharedPreferences.getInstance();
//                   prefs.setBool('showHome', false);
//                   Get.toNamed('/login');
//                 },
//                 icon: const Icon(Icons.logout_outlined))
//           ],
//         ),
//         drawer: const Drawer(),
//         body: SafeArea(
//           child: Column(
//             children: <Widget>[
//               Obx(
//                 () => controller.isLoading.value
//                     ? const Center(child: ButtonLoaderWhite())
//                     : controller.data.value.user!.email!.isEmpty
//                         ? const Text(
//                             'Error retrieving user records',
//                             style: TextStyle(color: Colors.black),
//                           )
//                         : Expanded(
//                             child: ListView.builder(
//                                 itemCount:
//                                     1, //  controller.data.value.user!.toString().length,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   return Card(
//                                     color: Colors.white,
//                                     child: Padding(
//                                       padding: const EdgeInsets.fromLTRB(
//                                           12, 10, 2, 10),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           // _user != null
//                                           //     ? Expanded(
//                                           //         child: ClipOval(
//                                           //           child: Material(
//                                           //             color: CustomColors
//                                           //                 .firebaseGrey
//                                           //                 .withOpacity(0.3),
//                                           //             child: Image.network(
//                                           //               _user!,
//                                           //               fit: BoxFit.fitHeight,
//                                           //             ),
//                                           //           ),
//                                           //         ),
//                                           //       )
//                                           //     :
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: ClipOval(
//                                               child: Material(
//                                                 color: CustomColors.firebaseGrey
//                                                     .withOpacity(0.3),
//                                                 child: Padding(
//                                                   padding: const EdgeInsets.all(
//                                                       16.0),
//                                                   child: Icon(
//                                                     Icons.person,
//                                                     size: 60,
//                                                     color: CustomColors
//                                                         .firebaseGrey,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),

//                                           Text(
//                                             'Available Balance',
//                                             style: const TextStyle(
//                                                 color: Colors.black),
//                                           ),
//                                           Text(
//                                             controller.data.value.user!.wallet!
//                                                 .currentBalance
//                                                 .toString(),
//                                             style: const TextStyle(
//                                                 color: Colors.black),
//                                           ),

//                                           SizedBox(
//                                             height: 20,
//                                           ),
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceEvenly,
//                                             children: [
//                                               Icon(
//                                                 Icons.arrow_upward,
//                                                 color: Colors.black,
//                                                 size: 24.0,
//                                                 semanticLabel: 'person icon',
//                                               ),
//                                               SizedBox(
//                                                 width: 5,
//                                               ),
//                                               Text(
//                                                 'Top Up',
//                                                 style: const TextStyle(
//                                                     color: Colors.black),
//                                               ),
//                                               SizedBox(
//                                                 width: 100,
//                                               ),
//                                               Icon(
//                                                 Icons.arrow_downward,
//                                                 color: Colors.black,
//                                                 size: 24.0,
//                                                 semanticLabel: 'email icon',
//                                               ),
//                                               SizedBox(
//                                                 width: 5,
//                                               ),
//                                               Text(
//                                                 'Withdraw',
//                                                 style: const TextStyle(
//                                                     color: Colors.black),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 }),
//                           ),
//               ),
//               walletController.data.value.data != null
//                   ? Expanded(
//                       child: ListView.builder(
//                           itemCount: walletController.data.value.data?.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Padding(
//                               padding: const EdgeInsets.all(12.0),
//                               child: Card(
//                                   elevation: 2,
//                                   color: Colors.white,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(12.0),
//                                     child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         children: [
//                                           Text(
//                                               'Transaction Type: ${walletDetails(index).transactionType}'
//                                                   .replaceAll(
//                                                       "TransactionType.", ""),
//                                               style: const TextStyle(
//                                                   color: Colors.black)),
//                                           Text(
//                                               'Amount: ${walletDetails(index).amount}'
//                                                   .replaceAll("Amount.", ""),
//                                               style: const TextStyle(
//                                                   color: Colors.black)),
//                                           Text(
//                                               'Previous Balance: ${walletDetails(index).previousBalance}'
//                                                   .replaceAll(
//                                                       "PreviousBalance.", ""),
//                                               style: const TextStyle(
//                                                   color: Colors.black)),
//                                           Text(
//                                               'Source: ${walletDetails(index).source}'
//                                                   .replaceAll("Source.", ""),
//                                               style: const TextStyle(
//                                                   color: Colors.black)),
//                                           Text(
//                                               'Transaction Id: ${walletDetails(index).trxId}'
//                                                   .replaceAll("trx_id.", ""),
//                                               style: const TextStyle(
//                                                   color: Colors.black)),
//                                           Text(
//                                               'Narration: ${walletDetails(index).narration}'
//                                                   .replaceAll("narration.", ""),
//                                               style: const TextStyle(
//                                                   color: Colors.black)),
//                                         ]),
//                                   )),
//                             );
//                           }),
//                     )
//                   : const Text(
//                       'No data retrieved',
//                       style: TextStyle(color: Colors.black),
//                     )
//             ],
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
//         // floatingActionButton: FloatingActionButton(
//         //     elevation: 30,
//         //     child: Icon(Icons.edit),
//         //     onPressed: () {
//         //       Get.offAllNamed('/editProfile');
//         //     }),
//         bottomSheet: BottomSheet(
//           onClosing: () {},
//           builder: (context) {
//             return bottomSheetContainer();
//           },
//         ));
//   }
// }

// class WalletData {
//   call(int index) {
//     GetWalletTransactionsController detailsController = Get.find();

//     return detailsController.data.value.data![index];

//     //return controller.exams.value.message!.examApplications![index];
//   }
// }
