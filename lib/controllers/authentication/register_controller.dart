import 'package:get/get.dart';
import 'package:mwiti_app/helpers/baseresponse.dart';
import 'package:mwiti_app/models/authentication/register_model.dart';
import 'package:mwiti_app/models/error_model.dart';
import 'package:mwiti_app/widgets/dialog.dart';

class RegisterController extends GetxController {
  String url = "/auth/register";
  String method = "POST";
  var isLoading = false.obs;
  var data = RegisterModel().obs;
  var error = ErrorModel().obs;
  var success = false.obs;

  Future<void> userRegister(Map<String, dynamic> body) async {
    isLoading(true);
    var response = await BaseResponse()
        .makeApiCall(method, url, body: body, fromModel: registerModelFromJson);
    if (response != null) {
      showDialogSuccess("Success", "Registered successfully");
      data.value = response;
      isLoading(false);
      //if(data.value.message.contains(other))
      // Get.toNamed("/otp");
      //String _user = body.values..toString();

      Get.toNamed("/client_home");
    }

    //   if (body.containsValue(3)) {
    //     print('service provider');
    //     Get.to(() => const CompleteServiceProviderRegScreen(
    //         //  user: data.value.data!.user!.email.toString(),
    //         ));
    //   } else {
    //     print('client');
    //     Get.to(() => const OTPScreen(
    //         //  user: data.value.data!.user!.email.toString(),
    //         ));
    //   }
    // }

    // } else if (data.value. == false || error.value.success == false) {
    //   Get.snackbar(
    //       error.value.detail.toString(), error.value.detail.toString());
    // }
    else {
      Get.snackbar(
          error.value.detail.toString(), error.value.detail.toString());
      data.value = RegisterModel();
      isLoading(false);
    }
  }

  void userLogout() async {
    success(false);
    Get.offAllNamed("/login");
  }
}
