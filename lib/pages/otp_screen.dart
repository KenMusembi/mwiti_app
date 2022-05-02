// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:alt_sms_autofill/alt_sms_autofill.dart';
// import 'package:flutter/services.dart';
// import 'package:fundi254_mobile/controllers/authentication/login_controller.dart';
// import 'package:fundi254_mobile/utils/location_util.dart';
// import 'package:fundi254_mobile/widgets/dialog.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// class OTPScreen extends StatefulWidget {
//   const OTPScreen({Key? key}) : super(key: key);

//   @override
//   _OTPScreenState createState() => _OTPScreenState();
// }

// class _OTPScreenState extends State<OTPScreen> {
//   LoginController controller = Get.put(LoginController());
//   TextEditingController? textEditingController1;

//   String _comingSms = 'Unknown';
//   final user = FirebaseAuth.instance.currentUser;
//   Future<void> initSmsListener() async {
//     String comingSms;
//     try {
//       comingSms = (await AltSmsAutofill().listenForSms)!;
//     } on PlatformException {
//       comingSms = 'Failed to get Sms.';
//     }
//     if (!mounted) return;
//     setState(() {
//       _comingSms = comingSms;
//       if (kDebugMode) {
//         print("====>Message: $_comingSms");

//         print(_comingSms);
//       }
//       textEditingController1!.text = _comingSms[51] +
//           _comingSms[52] +
//           _comingSms[53] +
//           _comingSms[
//               54]; //used to set the code in the message to a string and setting it to a textcontroller. message length is 38. so my code is in string index 32-37.
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     textEditingController1 = TextEditingController();
//     initSmsListener();
//   }

//   @override
//   void dispose() {
//     // textEditingController1!.dispose();
//     AltSmsAutofill().unregisterListener();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           const SizedBox(
//             height: 100,
//           ),
//           const Text(
//             'OTP Verification',
//             style: TextStyle(
//               fontFamily: 'Canela',
//               fontSize: 34,
//               color: Color(0xff000000),
//               letterSpacing: -1.48,
//               fontWeight: FontWeight.w700,
//             ),
//             softWrap: false,
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           const Text(
//             'Please enter the 4 digit code\nsent to your phone number',
//             style: TextStyle(
//               fontFamily: 'Canela',
//               fontSize: 22,
//               color: Color(0xff000000),
//               letterSpacing: -0.64,
//             ),
//             textAlign: TextAlign.center,
//             softWrap: false,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: Flexible(
//               child: PinCodeTextField(
//                 appContext: context,
//                 pastedTextStyle: TextStyle(
//                   color: Colors.grey.shade600,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 length: 4,
//                 obscureText: false,
//                 animationType: AnimationType.fade,
//                 pinTheme: PinTheme(
//                     shape: PinCodeFieldShape.box,
//                     borderRadius: BorderRadius.circular(10),
//                     fieldHeight: 50,
//                     fieldWidth: 40,
//                     inactiveFillColor: Colors.grey,
//                     inactiveColor: Colors.grey,
//                     selectedColor: Colors.grey,
//                     selectedFillColor: Colors.grey.shade200,
//                     activeFillColor: Colors.grey.shade400,
//                     activeColor: Colors.grey),
//                 cursorColor: Colors.black,
//                 animationDuration: const Duration(milliseconds: 300),
//                 enableActiveFill: true,
//                 controller: textEditingController1,
//                 keyboardType: TextInputType.number,
//                 boxShadows: const [
//                   BoxShadow(
//                     offset: Offset(0, 1),
//                     color: Colors.black12,
//                     blurRadius: 10,
//                   )
//                 ],
//                 onCompleted: (value) async {
//                   // showDialogFail('message', value.toString());
//                   Position position = await GetGeoLocationPosition();
//                   await controller.userLogin({
//                     "email": user!.email,
//                     "password": value.toString(),
//                     "lat": position.latitude,
//                     "lng": position.longitude

//                     //do something or move to next screen when code complete
//                   });
//                 },
//                 onChanged: (value) {
//                   if (kDebugMode) {
//                     print(value);
//                   }
//                   setState(() {
//                     if (kDebugMode) {
//                       print(value);
//                     }
//                   });
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 50,
//           ),
//           const Text(
//             'Please enter the 4 digit code\nsent to your phone number',
//             style: TextStyle(
//               fontFamily: 'Canela',
//               fontSize: 22,
//               color: Color(0xff000000),
//               letterSpacing: -0.64,
//             ),
//             textAlign: TextAlign.center,
//             softWrap: false,
//           ),
//           const SizedBox(
//             height: 50,
//           ),
//           SizedBox(
//             width: 300,
//             child: TextButton(
//               onPressed: () async {
//                 // showDialogFail('Allow Permissions',
//                 //     'allow sms permissions for sms to be picked automatically');
//                 Get.toNamed("/client_home");
//               },
//               child: const Text('Verify and Proceed'),
//               style: TextButton.styleFrom(
//                 padding: const EdgeInsets.all(16.0),
//                 primary: Colors.white,
//                 backgroundColor: const Color(0XFF0051A2),
//                 textStyle: const TextStyle(fontSize: 22, color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       )),
//     );
//   }
// }
