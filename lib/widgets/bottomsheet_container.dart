import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mwiti_app/controllers/authentication/login_controller.dart';

LoginController controller = Get.put(LoginController());

Widget bottomSheetContainer() {
  return Container(
    height: 60,
    width: double.infinity,
    color: Colors.white,
    alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            child: Column(
              children: [
                Expanded(child: Image.asset('assets/home_icon.png')),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Home',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
            onTap: () {
              //if statement to show different pages
              // if (controller.data.value.user!.userGroup == 2) {
              //   Get.toNamed('/client_home');
              // } else if (controller.data.value.user!.userGroup == 3) {
              //   Get.toNamed('/provider_home');
              // } else {
              //   Get.snackbar('Admin?', 'Use a client or provider account');
              // }
              Get.reload();
              Get.snackbar('Coming Soon', 'this feature is being worked on');
            },
          ),
          InkWell(
            child: Column(
              children: [
                Expanded(child: Image.asset('assets/request_icon.png')),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Requests',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
            onTap: () {
              //if client show the home page, if provider show bidding page with posted requests
              // if (controller.data.value.user!.userGroup == 2) {
              //   //Get.toNamed('/requests');
              //   Get.snackbar('Coming Soon', 'this feature is being worked on');
              // } else if (controller.data.value.user!.userGroup == 3) {
              //   //Get.toNamed('/bids_page');
              //   Get.snackbar('Coming Soon', 'this feature is being worked on');
              // } else {
              //   //Get.snackbar('Admin?', 'Use a client or provider account');
              //   Get.snackbar('Coming Soon', 'this feature is being worked on');
              // }
            },
          ),
          InkWell(
            child: Column(
              children: [
                Expanded(child: Image.asset('assets/account_icon.png')),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Account',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
            onTap: () {
              Get.toNamed('/account');
            },
          ),
          InkWell(
            child: Column(
              children: [
                Expanded(child: Image.asset('assets/wallet_icon.png')),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Wallet',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
            onTap: () {
              Get.toNamed('/wallet');
            },
          ),
          // ElevatedButton.icon(
          //     onPressed: () {},
          //     style: ElevatedButton.styleFrom(
          //       onPrimary: Colors.white,
          //       primary: Colors.green,
          //     ),
          //     icon: const Icon(
          //       FontAwesomeIcons.house,
          //       color: Colors.blue,
          //     ),
          //     label: const Text('Home')),
        ],
      ),
    ),
  );
}
