import 'package:get/get.dart';
import 'package:mwiti_app/controllers/authentication/login_controller.dart';
import 'package:mwiti_app/helpers/baseresponse.dart';
import 'package:mwiti_app/models/service_provider/employees_model.dart';

class GetEmployeesController extends GetxController {
  String method = "GET";
  String url = "/employee/employee";
  var isLoading = false.obs;
  var data = GetEmployeesModel().obs;

  LoginController controller = Get.put(LoginController());

  @override
  void onInit() {
    getEmployees();
    super.onInit();
  }

  Future<void> getEmployees() async {
    try {
      isLoading(true);
      var response = await BaseResponse().makeApiCall(method, url,
          fromModel: getEmployeesModelFromJson,
          token: controller.data.value.token.toString());

      if (response != null) {
        isLoading(false);
        data.value = response;
        print('employees' + data.string.toString());
        print('token' + controller.data.value.token.toString());
      } else {
        isLoading(false);
        data.value = GetEmployeesModel();
      }
    } finally {
      isLoading(false);
    }
  }
}
