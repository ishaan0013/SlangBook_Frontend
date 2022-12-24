import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slang_app_user/models/PlanModel.dart';
import 'package:slang_app_user/repositories/free_trial.dart';
import 'package:slang_app_user/repositories/subscription.dart';

import '../../repositories/plans.dart';

class SubscriptionScreenController extends GetxController {
  var selectedPlan = 0.obs;
  var plans = RxList<PlanModel>();
  late SharedPreferences _preferences;
  var loading = false.obs;
  var loadingSubs = false.obs;
  var isSubscribed = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    _preferences = await SharedPreferences.getInstance();
    checkIfSubToPlan();
    getAllPlans();
  }

  void getAllPlans() async {
    loading.value = true;
    var res = await getAllPlansRepo();
    if (res != null) {
      plans.value = res;
      loading.value = false;
    }
  }

  checkIfSubToPlan() async {
    loadingSubs.value = true;
    String token = _preferences.getString('token')!;

    var res = await checkIfSubscribeToPlanRepo(token);
    if (res != null) {
      if (res.response) {
        isSubscribed.value = true;
      }
      loadingSubs.value = false;
    }
  }

  void onFreeTrialButtonPressed() async {
    loading.value = true;
    String token = _preferences.getString('token')!;

    var response = await subscribeToFreeTrialRepo(token);
    if (response != null) {
      if (response.response) {
        Fluttertoast.showToast(msg: response.message);
      } else {
        Fluttertoast.showToast(msg: response.message);
      }
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
    loading.value = false;
  }

  void onStartPlanButtonPressed() async {
    loading.value = true;
    String token = _preferences.getString('token')!;
    var res = await subscribeToPlan(
        planId: plans[selectedPlan.value].id, token: token);
    if (res != null) {
      if (res.response) {
        loading.value = false;
        Fluttertoast.showToast(msg: res.message);
      } else {
        loading.value = false;
        Fluttertoast.showToast(msg: res.message);
      }
    }
  }
}
