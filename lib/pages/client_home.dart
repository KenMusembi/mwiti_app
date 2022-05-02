import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mwiti_app/controllers/service_provider/employees_controller.dart';
import 'package:mwiti_app/models/service_provider/employees_model.dart';
import 'package:mwiti_app/widgets/bottomsheet_container.dart';
import 'package:mwiti_app/widgets/buttonloader.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientHomeScreen extends StatefulWidget {
  const ClientHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ClientHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ClientHomeScreen> {
  GetEmployeesController employeesController =
      Get.put(GetEmployeesController());

  var employees = GetEmployeesModel();
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'What service are you looking for today?',
                style: TextStyle(
                  fontFamily: 'Canela',
                  fontSize: 21,
                  color: Color(0xff0051a2),
                  letterSpacing: -0.8200000000000001,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              //  color: Colors.grey.shade200,
              width: 360,
              height: 62,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/search_icon.png'),
                  ),
                  const SizedBox(
                      width: 250,
                      child: Text(
                        'Search for a category here',
                        style: TextStyle(color: Colors.black, fontSize: 21),
                      )),
                ],
              ),
            ),
            Obx(
              () => employeesController.isLoading.value
                  ? const Center(child: ButtonLoaderWhite())
                  : employeesController.data.value.id == null
                      ? const Text(
                          'No records',
                          style: TextStyle(color: Colors.black),
                        )
                      : Flexible(
                          child: GridView.count(
                            // Create a grid with 2 columns. If you change the scrollDirection to
                            // horizontal, this produces 2 rows.
                            crossAxisCount: 2,
                            // Generate 100 widgets that display their index in the List.
                            children: List.generate(
                                // employeesController.data.length
                                4, (index) {
                              return Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Card(
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      //Icon(, color: Colors.white),
                                      Expanded(
                                        child: Image.network(employeesController
                                            .data.value.passportPhoto //.iconUrl
                                            .toString()),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          employeesController.data.value.id !=
                                                  null
                                              ? employeesController
                                                  .data.value.status
                                                  .toString()
                                              : const Text(
                                                  "Category name not available",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ).toString(),
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
            ),
          ],
        ),
        bottomSheet: BottomSheet(
          onClosing: () {},
          builder: (context) {
            return bottomSheetContainer();
          },
        ));
  }
}
