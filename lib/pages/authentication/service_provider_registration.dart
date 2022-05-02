// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:fundi254_mobile/controllers/authentication/register_controller.dart';
// import 'package:fundi254_mobile/utils/location_util.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:sms_autofill/sms_autofill.dart';

// class ServiceProviderRegistrationScreen extends StatefulWidget {
//   const ServiceProviderRegistrationScreen({
//     Key? key,
//     String? user,
//   })  : _user = user,
//         super(key: key);

//   final String? _user;

//   @override
//   State<ServiceProviderRegistrationScreen> createState() =>
//       _ServiceProviderRegistrationScreenState();
// }

// class _ServiceProviderRegistrationScreenState
//     extends State<ServiceProviderRegistrationScreen> {
//   final _formKey = GlobalKey<FormState>();
//   late String? _user;

//   //String? firstName, lastName, email, phoneNumber;
//   TextEditingController? firstNameController,
//       lastNameController,
//       phoneNumberController;

//   RegisterController regcontroller = Get.put(RegisterController());

//   @override
//   void initState() {
//     _user = widget._user;

//     super.initState();
//     firstNameController = TextEditingController();
//     lastNameController = TextEditingController();
//     phoneNumberController = TextEditingController();
//     final user2 = FirebaseAuth.instance.currentUser;
//     print(user2);
//   }

//   final user = FirebaseAuth.instance.currentUser;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffffffff),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: ListView(
//             children: [
//               Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: const [
//                     SizedBox(
//                       height: 1,
//                     ),
//                     Center(
//                       child: Text(
//                         'Set up your account',
//                         style: TextStyle(
//                           fontFamily: 'Canela',
//                           fontSize: 24,
//                           color: Color(0xff000000),
//                           letterSpacing: -1.08,
//                           fontWeight: FontWeight.w700,
//                         ),
//                         softWrap: false,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 7,
//                     ),
//                     Text(
//                       'Sign up as a service provider',
//                       style: TextStyle(
//                         fontFamily: 'Canela',
//                         fontSize: 16,
//                         color: Color(0xff000000),
//                         letterSpacing: -0.64,
//                       ),
//                       textAlign: TextAlign.center,
//                       softWrap: false,
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),

//               //first name
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.fromLTRB(37, 12, 8, 5),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           'First Name',
//                           style: TextStyle(
//                             fontFamily: 'Canela',
//                             fontSize: 16,
//                             color: Color(0xff000000),
//                             letterSpacing: -0.64,
//                           ),
//                           //  textAlign: TextAlign.right,
//                           softWrap: false,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       //  color: Colors.grey.shade200,
//                       width: 320,
//                       height: 75,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           color: Colors.grey.shade200,
//                           borderRadius: BorderRadius.circular(15)),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: TextFormField(
//                             // enableSuggestions: true,
//                             //keyboardType: TextInputType.text,
//                             //textCapitalization: TextCapitalization.words,
//                             textDirection: TextDirection.ltr,
//                             controller: firstNameController,
//                             style: const TextStyle(color: Colors.black),
//                             autocorrect: true,
//                             // onChanged: (value) {
//                             //   firstNameController!.text = value;
//                             // },
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "Please enter first name";
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.all(8),
//                                 icon: const Icon(
//                                   Icons.person,
//                                   color: Colors.black,
//                                 ),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 helperStyle:
//                                     const TextStyle(color: Colors.black),
//                                 hintText: "First Name",
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(25.0),
//                                 ),
//                                 helperText: ("Your first name"))),
//                       ),
//                     ),

//                     const SizedBox(
//                       height: 12,
//                     ),

//                     //second name

//                     const Padding(
//                       padding: EdgeInsets.fromLTRB(37, 12, 8, 5),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           'Last Name',
//                           style: TextStyle(
//                             fontFamily: 'Canela',
//                             fontSize: 16,
//                             color: Color(0xff000000),
//                             letterSpacing: -0.64,
//                           ),
//                           //  textAlign: TextAlign.right,
//                           softWrap: false,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       //  color: Colors.grey.shade200,
//                       width: 320,
//                       height: 75,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           color: Colors.grey.shade200,
//                           borderRadius: BorderRadius.circular(15)),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: TextFormField(
//                             controller: lastNameController,
//                             style: const TextStyle(color: Colors.black),
//                             autocorrect: false,
//                             // onChanged: (value) {
//                             //   lastNameController!.text = value;
//                             // },
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "Please enter last name";
//                               }
//                             },
//                             decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.all(8),
//                                 icon: const Icon(
//                                   Icons.person,
//                                   color: Colors.black,
//                                 ),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 helperStyle:
//                                     const TextStyle(color: Colors.black),
//                                 hintText: "Last Name",
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(25.0),
//                                 ),
//                                 helperText: ("Your last name"))),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     //phone number
//                     Column(
//                       children: [
//                         const Padding(
//                           padding: EdgeInsets.fromLTRB(37, 12, 8, 5),
//                           child: Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               'Phone Number',
//                               style: TextStyle(
//                                 fontFamily: 'Canela',
//                                 fontSize: 16,
//                                 color: Color(0xff000000),
//                                 letterSpacing: -0.64,
//                               ),
//                               //  textAlign: TextAlign.right,
//                               softWrap: false,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           //  color: Colors.grey.shade200,
//                           width: 320,
//                           height: 75,
//                           decoration: BoxDecoration(
//                               shape: BoxShape.rectangle,
//                               color: Colors.grey.shade200,
//                               borderRadius: BorderRadius.circular(15)),
//                           child: Padding(
//                             padding: const EdgeInsets.fromLTRB(8, 14, 8, 8),
//                             child: TextFormField(
//                                 keyboardType: TextInputType.phone,
//                                 controller: phoneNumberController,
//                                 style: const TextStyle(color: Colors.black),
//                                 autocorrect: false,
//                                 // onChanged: (value) {
//                                 //   phoneNumberController!.text = value;
//                                 // },
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return "Please enter phone number";
//                                   }
//                                 },
//                                 decoration: InputDecoration(
//                                     contentPadding: EdgeInsets.all(8),
//                                     icon: const Icon(
//                                       Icons.phone,
//                                       color: Colors.black,
//                                     ),
//                                     filled: true,
//                                     fillColor: Colors.white,
//                                     helperStyle:
//                                         const TextStyle(color: Colors.black),
//                                     hintText: "Phone Number",
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(25.0),
//                                     ),
//                                     helperText: ("Your phone number"))),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(
//                 height: 12,
//               ),

//               const Text.rich(
//                 TextSpan(
//                   style: TextStyle(
//                     fontFamily: 'Helvetica',
//                     fontSize: 14,
//                     color: Color(0xff000000),
//                     letterSpacing: -0.52,
//                   ),
//                   children: [
//                     TextSpan(
//                       text: 'By registering you agree to the ',
//                     ),
//                     TextSpan(
//                       text: 'terms and conditions',
//                       style: TextStyle(
//                         color: Color(0xff3827ff),
//                       ),
//                     ),
//                     TextSpan(
//                       text: ' \nand ',
//                     ),
//                     TextSpan(
//                       text: 'privacy policy ',
//                       style: TextStyle(
//                         color: Color(0xff4334f7),
//                       ),
//                     ),
//                     TextSpan(
//                       text: 'of Fundi254',
//                     ),
//                   ],
//                 ),
//                 textHeightBehavior:
//                     TextHeightBehavior(applyHeightToFirstAscent: false),
//                 textAlign: TextAlign.center,
//                 softWrap: false,
//               ),
//               const SizedBox(
//                 height: 12,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: SizedBox(
//                   width: 300,
//                   child: TextButton(
//                     onPressed: () async {
//                       Position position = await GetGeoLocationPosition();
//                       // String location =
//                       //     'Lat: ${position.latitude} , Long: ${position.longitude}';
//                       //  GetAddressFromLatLong(position);
//                       //print(location);

//                       if (_formKey.currentState!.validate()) {
//                         if (lastNameController!.text == '' ||
//                             phoneNumberController!.text == '') {
//                           Get.snackbar('Incomplete', 'Fill in all the fields',
//                               colorText: Colors.black);
//                         } else {
//                           // print(
//                           //   "first_name: " +
//                           //       firstNameController!.text.toString() +
//                           //       "last_name" +
//                           //       lastNameController!.text.toString() +
//                           //       "email" +
//                           //       user!.email.toString() +
//                           //       "phone_no" +
//                           //       phoneNumberController!.text.toString() +
//                           //       "lat" +
//                           //       position.latitude.toString() +
//                           //       "lng" +
//                           //       position.longitude.toString(),
//                           // );
//                           await regcontroller.userRegister({
//                             "first_name": firstNameController!.text.toString(),
//                             "last_name": lastNameController!.text.toString(),
//                             "user_group": 3,
//                             "email": user!.email,
//                             "phone_no": phoneNumberController!.text.toString(),
//                             "lat": position.latitude.toString(),
//                             "lng": position.longitude.toString(),
//                             "app_id": "qwerty123"
//                           });
//                         }
//                       }
//                     },
//                     child: Text(
//                         regcontroller.isLoading.value ? "Loading" : "Continue",
//                         style: const TextStyle(
//                             letterSpacing: 2,
//                             fontSize: 20,
//                             color: Colors.white)),
//                     style: TextButton.styleFrom(
//                       padding: const EdgeInsets.all(16.0),
//                       primary: Colors.white,
//                       backgroundColor: const Color(0XFF0051A2),
//                       textStyle:
//                           const TextStyle(fontSize: 22, color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
