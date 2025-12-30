import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/app/pages/profile_screen/profile_controller.dart';
import 'package:a_nxt/device/device.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteScreen extends StatelessWidget {
  const DeleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: 'Delete Account'.tr,
            isVisible: true,
            isCenter: true,
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: Dimens.edgeInsets20_10_20_10,
              child: CustomButton(
                onPressed: () {
                  if (controller.deleteKey.currentState!.validate()) {
                    if (controller.deleteController.text == "DELETE") {
                      Get.back();
                      Get.find<DeviceRepository>().deleteAllSecuredValues();
                      Get.find<DeviceRepository>().deleteBox();
                      RouteManagement.goToAuthScreen();
                    }
                  }
                },
                heightBtn: Dimens.fourtyFive,
                text: "Delete",
                backgroundColor: ColorsValue.redColor,
                widthBtn: Dimens.hundred,
                textStyle: Styles.whiteColorW60016.copyWith(
                  fontSize: Dimens.sixteen,
                ),
                isColor: true,
              ),
            ),
          ),
          body: Form(
            key: controller.deleteKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              padding: Dimens.edgeInsets20,
              physics: ClampingScrollPhysics(),
              children: [
                Text(
                  "Are you sure you want to delete your account? Please read how account deletion will affect.",
                  style: Styles.txtGreyColorW40014,
                ),
                Dimens.boxHeight10,
                Text("Account", style: Styles.txtBlackColorW60016),
                Dimens.boxHeight10,
                Text(
                  "Once you confirm, your account will be scheduled for permanent deletion and all your data will be removed within 7 days. You will not be able to recover your account after this period. Continue?",
                  style: Styles.txtGreyColorW40014,
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.deleteController,
                  isTitle: true,
                  title: "Confirm Account Deletion",
                  hintText: "Enter DELETE",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintStyle: Styles.txtGreyColorW50014,
                  fillColor: ColorsValue.textFieldBg,
                  filled: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter DELETE";
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
