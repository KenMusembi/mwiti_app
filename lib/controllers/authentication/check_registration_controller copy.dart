// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sms_autofill/sms_autofill.dart';

// class CheckRegistrationController extends GetxController {
//   String url = "/auth/check";
//   String method = "POST";
//   var isLoading = false.obs;
//   var data = CheckRegistration().obs;
//   var success = false.obs;

//   Future<void> checkRegistration(Map<String, String> body) async {
//     isLoading(true);
//     var response = await BaseResponse().makeApiCall(method, url,
//         body: body, fromModel: checkRegistrationFromJson);
//     if (response != null) {
//       if (kDebugMode) {
//         print(response.toString());
//       }
//       //showDialogSuccess("Registered", "User is registered.");
//       data.value = response;
//       isLoading(false);
//       // var _user = body.values.first.toString().obs;
//       // Get.toNamed("/register");
//       String? _user = body.values.first.toString();

//       // foo(BuildContext context) {
//       //   Navigator.of(context).pushReplacement(MaterialPageRoute(
//       //       builder: (context) => OTPScreen(
//       //             user: _user,
//       //           )));
//       // }

// //testing the obx feature
//       Obx(() => Text(data.string));
//       final signature = await SmsAutoFill().getAppSignature;
//       print('app signature ' + signature);

//       Get.to(() => OTPScreen(
//           // user: _user,
//           ));
//       // foo(_user, cotext);

//       if (data.value.message!.contains('E-Mail NOT is registered')) {
//         //register
//         // Get.toNamed("/register");
//         // showDialogFail('email', body.toString());
//         // String _user = body.values.first.toString();
//         // void foo(BuildContext context) {
//         //   Navigator.of(context).pushReplacement(MaterialPageRoute(
//         //       builder: (context) => RegisterScreen(
//         //             user: _user,
//         //           )));
//         // }

//         Get.to(() => RegisterScreen(
//               user: _user,
//             ));
//       } else {
//         //login
//         //  Get.toNamed("/otp");

//       }
//     } else {
//       //showDialogFail("Failed", data.value.toString());
//       Get.defaultDialog(title: "Failure", content: Text(data.value.toString()));
//       data.value = CheckRegistration();
//       isLoading(false);
//     }
//   }

//   void userLogout() async {
//     success(false);
//     Get.offAllNamed("/login");
//   }
// }
