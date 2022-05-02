import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mwiti_app/controllers/authentication/login_controller.dart';
import 'package:mwiti_app/controllers/service_provider/employees_controller.dart';
import 'package:mwiti_app/res/custom_colors.dart';
import 'package:mwiti_app/widgets/bottomsheet_container.dart';
import 'package:mwiti_app/widgets/buttonloader.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

@override
void initState() {}

class _AccountScreenState extends State<AccountScreen> {
  var _user =
      'https://images.unsplash.com/photo-1633985918830-5a112c01cbd7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nzd8fHBlcnNvbiUyMHBvcnRhaXQlMjB3b21hbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60';
  //LoginController controller = Get.put(LoginController());
  GetEmployeesController controller = Get.put(GetEmployeesController());

  @override
  void setState(VoidCallback fn) async {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: const Color(0xff0051A2),
          title: const Center(child: Text('Fundi254')),
          actions: [
            IconButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', false);
                  Get.toNamed('/login');
                },
                icon: const Icon(Icons.logout_outlined))
          ],
        ),
        drawer: const Drawer(),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => controller.isLoading.value
                    ? const Center(child: ButtonLoaderWhite())
                    : controller.data.value.ethnicity!.isEmpty
                        ? const Text(
                            'Error retrieving user records',
                            style: TextStyle(color: Colors.black),
                          )
                        : Flexible(
                            child: ListView.builder(
                                itemCount:
                                    1, //  controller.data.value.user!.toString().length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Card(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            12, 10, 2, 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            // _user != null
                                            //     ? Expanded(
                                            //         child: ClipOval(
                                            //           child: Material(
                                            //             color: CustomColors
                                            //                 .firebaseGrey
                                            //                 .withOpacity(0.3),
                                            //             child: Image.network(
                                            //               _user!,
                                            //               fit: BoxFit.fitHeight,
                                            //             ),
                                            //           ),
                                            //         ),
                                            //       )
                                            //     :
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ClipOval(
                                                child: Material(
                                                  color: CustomColors
                                                      .firebaseGrey
                                                      .withOpacity(0.3),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 60,
                                                      color: CustomColors
                                                          .firebaseGrey,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                //Image.asset('assets/email_icon.png'),
                                                Icon(
                                                  Icons.email,
                                                  color: Colors.black,
                                                  size: 24.0,
                                                  semanticLabel: 'email icon',
                                                ),
                                                SizedBox(
                                                  width: 25,
                                                ),
                                                Text(
                                                  controller.data.value.id! !=
                                                          null
                                                      ? controller.data.value
                                                          .experience!
                                                          .toString()
                                                      : const Text(
                                                          "Category name not available",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ).toString(),
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.person,
                                                  color: Colors.black,
                                                  size: 24.0,
                                                  semanticLabel: 'person icon',
                                                ),
                                                SizedBox(
                                                  width: 25,
                                                ),
                                                Text(
                                                  controller.data.value.id !=
                                                          null
                                                      ? controller
                                                              .data.value.bio
                                                              .toString() +
                                                          controller
                                                              .data.value.gender
                                                              .toString()
                                                      : const Text(
                                                          "Category name not available",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ).toString(),
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.phone,
                                                  color: Colors.black,
                                                  size: 24.0,
                                                  semanticLabel: 'email icon',
                                                ),
                                                SizedBox(
                                                  width: 25,
                                                ),
                                                Text(
                                                  controller.data.value.id !=
                                                          null
                                                      ? controller
                                                          .data.value.rating
                                                          .toString()
                                                      : const Text(
                                                          "Category name not available",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ).toString(),
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.calendar_month,
                                                  color: Colors.black,
                                                  size: 24.0,
                                                  semanticLabel: 'email icon',
                                                ),
                                                SizedBox(
                                                  width: 25,
                                                ),
                                                Text(
                                                  controller.data.value.id !=
                                                          null
                                                      ? controller.data.value
                                                          .dateOfBirth
                                                          .toString()
                                                      : const Text(
                                                          "Category name not available",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ).toString(),
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.location_city,
                                                  color: Colors.black,
                                                  size: 24.0,
                                                  semanticLabel: 'email icon',
                                                ),
                                                SizedBox(
                                                  width: 25,
                                                ),
                                                Text(
                                                  controller.data.value.id !=
                                                          null
                                                      ? controller
                                                          .data.value.religion
                                                          .toString()
                                                      //     +
                                                      // controller
                                                      //     .data.value.user!.lng
                                                      //     .toString()
                                                      : const Text(
                                                          "Category name not available",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ).toString(),
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.person_outline,
                                                  color: Colors.black,
                                                  size: 24.0,
                                                  semanticLabel: 'person icon',
                                                ),
                                                SizedBox(
                                                  width: 25,
                                                ),
                                                Text(
                                                  controller.data.value.bio !=
                                                          null
                                                      ? controller.data.value
                                                          .toString()
                                                      : const Text(
                                                          "Category name not available",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ).toString(),
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.timelapse,
                                                  color: Colors.black,
                                                  size: 24.0,
                                                  semanticLabel:
                                                      'timelapse icon',
                                                ),
                                                SizedBox(
                                                  width: 25,
                                                ),
                                                Text(
                                                  controller.data.value.bio !=
                                                          null
                                                      ? controller.data.value
                                                          .highestEducationLevel
                                                          .toString()
                                                      : const Text(
                                                          "Category name not available",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ).toString(),
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        // floatingActionButton: FloatingActionButton(
        //     elevation: 30,
        //     child: Icon(Icons.edit),
        //     onPressed: () {
        //       Get.offAllNamed('/editProfile');
        //     }),
        bottomSheet: BottomSheet(
          onClosing: () {},
          builder: (context) {
            return bottomSheetContainer();
          },
        ));
  }
}
