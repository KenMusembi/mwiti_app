// import 'package:flutter/material.dart';
// import 'package:fundi254_mobile/pages/authentication/client_registration_screen.dart';
// import 'package:fundi254_mobile/pages/authentication/service_provider_registration.dart';
// //import 'package:fundi254_mobile/utils/authentication.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({Key? key, required String? user})
//       : _user = user,
//         super(key: key);

//   final String? _user;

//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   late String? _user;
//   //bool _isSigningOut = false;

//   @override
//   void initState() {
//     _user = widget._user;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff0051A2),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           const SizedBox(
//             height: 30,
//           ),
//           const Center(
//             child: Text(
//               'fundi254',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           const SizedBox(
//             height: 70,
//           ),
//           Flexible(
//             child: Image.asset(
//               'assets/washing.png',
//               height: 320,
//               width: 400,
//             ),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           const Center(
//             child: Text(
//               'Join As a',
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 36,
//                   fontWeight: FontWeight.normal),
//             ),
//           ),
//           const SizedBox(
//             height: 40,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width: 120,
//                 child: TextButton(
//                   onPressed: () {
//                     // Get.toNamed("/clientregistration");
//                     Navigator.of(context).pushReplacement(MaterialPageRoute(
//                         builder: (context) => ClientRegistrationScreen(
//                               user: _user,
//                             )));
//                   },
//                   child: const Text('Client'),
//                   style: TextButton.styleFrom(
//                     padding: const EdgeInsets.all(16.0),
//                     primary: const Color(0XFF0051A2),
//                     backgroundColor: Colors.white,
//                     textStyle:
//                         const TextStyle(fontSize: 22, color: Colors.white),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               SizedBox(
//                 //  width: 300,
//                 child: TextButton(
//                   onPressed: () {
//                     // Get.toNamed("/providerregistration");
//                     Navigator.of(context).pushReplacement(MaterialPageRoute(
//                         builder: (context) => ServiceProviderRegistrationScreen(
//                               user: _user,
//                             )));
//                   },
//                   child: const Text('Service Provider'),
//                   style: TextButton.styleFrom(
//                     padding: const EdgeInsets.all(16.0),
//                     primary: Colors.white,
//                     backgroundColor: Colors.blue.shade500,
//                     textStyle:
//                         const TextStyle(fontSize: 22, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
