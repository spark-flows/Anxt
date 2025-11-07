import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/app/pages/profile_screen/profile_page.dart';
import 'package:a_nxt/device/device.dart';
import 'package:a_nxt/domain/models/getProfile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileController(this.profilePreneter);

  ProfilePreneter profilePreneter;

  showLogoutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding:
                Utility.isTablet()
                    ? Dimens.edgeInsets20_30_20_30
                    : Dimens.edgeInsets20,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: ColorsValue.whiteColor,
              borderRadius: BorderRadius.circular(Dimens.twentyFour),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${'log_out'.tr} ?",
                  style: Styles.txtBlackColorW70020.copyWith(
                    fontSize:
                        Utility.isTablet() ? Dimens.twentyFour : Dimens.twenty,
                  ),
                ),
                Dimens.boxHeight20,
                Text(
                  "logout_des".tr,
                  style: Styles.txtBlackColorW60016.copyWith(
                    fontSize:
                        Utility.isTablet() ? Dimens.twenty : Dimens.sixteen,
                  ),
                  textAlign: TextAlign.center,
                ),
                Dimens.boxHeight24,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          Get.back();
                        },
                        heightBtn: Dimens.fourtyEight,
                        text: 'cancle'.tr,
                        textStyle: Styles.txtBlackColorW70016.copyWith(
                          fontSize:
                              Utility.isTablet()
                                  ? Dimens.twenty
                                  : Dimens.sixteen,
                        ),
                        isBorder: true,
                        backgroundColor: ColorsValue.whiteColor,
                      ),
                    ),
                    Dimens.boxWidth16,
                    Expanded(
                      child: CustomButton(
                        onPressed: () {
                          Get.find<DeviceRepository>().deleteAllSecuredValues();
                          Get.find<DeviceRepository>().deleteBox();
                          RouteManagement.goToAuthScreen();
                        },
                        isBorder: false,
                        heightBtn: Dimens.fourtyEight,
                        text: 'log_out'.tr,
                        textStyle: Styles.whiteColorW60016.copyWith(
                          fontSize:
                              Utility.isTablet()
                                  ? Dimens.twenty
                                  : Dimens.sixteen,
                        ),
                        backgroundColor: ColorsValue.redColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  GetProfileData? profileData;

  Future<void> getProfileApi() async {
    var response = await profilePreneter.getProfileApi(isLoading: false);
    profileData = null;
    if (response?.data != null) {
      profileData = response!.data;
      update();
    }
  }
}
