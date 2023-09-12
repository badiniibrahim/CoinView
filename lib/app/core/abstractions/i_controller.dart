import 'package:get/get.dart';

import '../../ui/snack_bar.dart';
import '../failure/app_exception.dart';

mixin IController on GetxController {
  void actionPerform({required Function action, Function? callback}) async {
    try {
      await action.call();
    } on AppException catch (e) {
      handleError(e);
    } finally {
      await callback?.call();
    }
  }

  bool handleError(error) {
    if (error is UnAuthorizedException) {
      SnackBars.errorSnackBar(
        title: 'Erreur',
        message: error.statusMessage,
        width: Get.width,
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    }

    return false;
  }
}
