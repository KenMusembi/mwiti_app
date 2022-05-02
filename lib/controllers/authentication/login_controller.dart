import 'package:get/get.dart';
import 'package:mwiti_app/helpers/baseresponse.dart';
import 'package:mwiti_app/models/authentication/login_model.dart';
import 'package:mwiti_app/widgets/dialog.dart';

class LoginController extends GetxController {
  String url = "/auth/";
  String method = "POST";
  var isLoading = false.obs;
  var data = LoginModel().obs;
  var success = false.obs;

  Future<void> userLogin(Map<String, dynamic> body) async {
    isLoading(true);
    var response = await BaseResponse()
        .makeApiCall(method, url, body: body, fromModel: loginModelFromJson);
    if (response != null) {
      showDialogSuccess("Success", "Logged in successfully");
      data.value = response;
      isLoading(false);
      //add if else statement
      // if (data.value.user!.userGroup == 2) {
      //   Get.toNamed("/client_home");
      // } else if (data.value.user!.userGroup == 3) {
      Get.toNamed("/client_home");
      //}
    } else {
      data.value = LoginModel();
      isLoading(false);
    }
  }

  void userLogout() async {
    success(false);
    Get.offAllNamed("/login");
  }
}
