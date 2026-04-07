import 'package:a_nxt/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SalesAnalyticsScreen extends StatelessWidget {
  const SalesAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalesAnalyticsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: 'Add Customer'.tr,
            isCenter: true,
            bgColor: ColorsValue.whiteColor,
            actions: [
              IconButton(
                onPressed: () {
                  RouteManagement.goToHomeScreen();
                },
                icon: Icon(Icons.home),
              ),
            ],
          ),
          body: SafeArea(
            child: ListView(
              padding: Dimens.edgeInsets20_10_20_20,
              physics: ClampingScrollPhysics(),
              children: [
                CustomTextFormField(
                  controller: controller.nameController,
                  isTitle: true,
                  titleStyle: Styles.txtBlackColorW70014,
                  hintStyle: Styles.txtGreyColorW50012,
                  hintText: 'Enter Customer Name'.tr,
                  title: 'Customer Name'.tr,
                  fillColor: ColorsValue.textFieldBg,
                  filled: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Enter Customer Name'.tr;
                    }
                    return null;
                  },
                ),
                Dimens.boxHeight20,
                CustomCountryPickerField(
                  textEditingController: controller.mobileController,
                  isTitle: true,
                  text: 'Mobile Number '.tr,
                  hintText: 'Enter Mobile Number '.tr,
                  titleStyle: Styles.txtBlackColorW70014.copyWith(
                    fontSize:
                        Utility.isTablet() ? Dimens.twenty : Dimens.fourteen,
                  ),
                  hintStyle: Styles.txtGreyColorW50012.copyWith(
                    fontSize:
                        Utility.isTablet() ? Dimens.eighteen : Dimens.fourteen,
                  ),
                  fillColor: ColorsValue.textFieldBg,
                  radius: Dimens.ten,
                  initialvalue: PhoneNumber(
                    isoCode: PhoneNumber.getISO2CodeByPrefix(
                      controller.dialCode,
                    ),
                  ),
                  onInputChanged: (PhoneNumber number) {
                    controller.dialCode = number.dialCode ?? '';
                    controller.update();
                  },
                  oninitialValidation: (bool value) {
                    controller.isValid = value;
                    controller.update();
                  },
                  keyboardAction: TextInputAction.next,
                  validation: (val) {
                    if (!controller.isValid) {
                      return "Enter Valid Mobile Number";
                    }
                    return null;
                  },
                ),
                Dimens.boxHeight20,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Customer Categories",
                    style: Styles.txtBlackColorW70014,
                  ),
                ),
                Dimens.boxHeight5,
                Container(
                  padding: Dimens.edgeInsets20_00_20_00,
                  height: Dimens.fifty,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorsValue.textFieldBg,
                    borderRadius: BorderRadius.circular(Dimens.ten),
                  ),
                  child: DropdownButton<String>(
                    underline: Container(),
                    isDense: true,
                    isExpanded: true,
                    value: controller.selectCustomerCate,
                    onChanged: (value) {
                      controller.selectCustomerCate = value!;
                      controller.update();
                    },
                    hint: Text(
                      "Select Customer Categories".tr,
                      style: Styles.txtGreyColorW50012.copyWith(
                        fontSize: Dimens.fourteen,
                      ),
                    ),
                    focusColor: Colors.white,
                    dropdownColor: ColorsValue.whiteColor,
                    style: Styles.txtBlackColorW50014,
                    iconEnabledColor: Colors.black,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: Dimens.twenty,
                    ),
                    items:
                        controller.categoriesList.isNotEmpty
                            ? controller.categoriesList.map((option) {
                              return DropdownMenuItem(
                                value: option,
                                child: Text(
                                  option,
                                  style: Styles.txtBlackColorW50014.copyWith(
                                    fontSize: Dimens.fourteen,
                                  ),
                                ),
                              );
                            }).toList()
                            : [],
                  ),
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.emailController,
                  isTitle: true,
                  titleStyle: Styles.txtBlackColorW70014,
                  hintStyle: Styles.txtGreyColorW50012,
                  hintText: 'Enter Email'.tr,
                  title: 'Email'.tr,
                  fillColor: ColorsValue.textFieldBg,
                  filled: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Enter Email'.tr;
                    } else if (!Utility.emailValidation(val)) {
                      return "Enter Valid Email";
                    }
                    return null;
                  },
                ),
                Dimens.boxHeight20,
                Autocomplete<Map<String, dynamic>>(
                  optionsBuilder: (TextEditingValue value) {
                    controller.onSearchChanged(value.text);
                    return controller.predictions;
                  },
                  initialValue: TextEditingValue(
                    text: controller.addressController.text,
                  ),
                  displayStringForOption: (option) => option['description'],
                  fieldViewBuilder: (
                    context,
                    textController,
                    focusNode,
                    onSubmit,
                  ) {
                    return CustomTextFormField(
                      controller: textController,
                      isTitle: true,
                      focusNode: focusNode,
                      titleStyle: Styles.txtBlackColorW70014,
                      hintStyle: Styles.txtGreyColorW50012,
                      hintText: 'Enter Store Address'.tr,
                      title: 'Store Address'.tr,
                      maxLines: 3,
                      fillColor: ColorsValue.textFieldBg,
                      filled: true,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      suffixIcon: InkWell(
                        onTap: () async {
                          if (await Utility.locationPermissionCheack()) {
                            controller.getCurrentLocation();
                            await RouteManagement.goToMapScreen(
                              controller.selectedLocation ??
                                  LatLng(21.170240, 72.831062),
                            );
                            // Sync map-selected address back to the Autocomplete text field
                            textController.text =
                                controller.addressController.text;
                            controller.update();
                          }
                        },
                        child: Padding(
                          padding: Dimens.edgeInsets10,
                          child: SvgPicture.asset(
                            AssetConstants.ic_location,
                            height: Dimens.twentyFour,
                            width: Dimens.twentyFour,
                          ),
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Enter Store Address'.tr;
                        }
                        return null;
                      },
                    );
                  },
                  onSelected: (option) {
                    controller.predictions = [];
                    controller.addressController.text = option['description'];
                    controller.getPlaceDetails(option['place_id']);
                    controller.update();
                  },
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.stateController,
                  isTitle: true,
                  titleStyle: Styles.txtBlackColorW70014,
                  hintStyle: Styles.txtGreyColorW50012,
                  hintText: 'Enter State'.tr,
                  title: 'State'.tr,
                  fillColor: ColorsValue.textFieldBg,
                  filled: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Enter State'.tr;
                    }
                    return null;
                  },
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.cityController,
                  isTitle: true,
                  titleStyle: Styles.txtBlackColorW70014,
                  hintStyle: Styles.txtGreyColorW50012,
                  hintText: 'Enter City'.tr,
                  title: 'City'.tr,
                  fillColor: ColorsValue.textFieldBg,
                  filled: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Enter City'.tr;
                    }
                    return null;
                  },
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.areaController,
                  isTitle: true,
                  titleStyle: Styles.txtBlackColorW70014,
                  hintStyle: Styles.txtGreyColorW50012,
                  hintText: 'Enter Area'.tr,
                  title: 'Area'.tr,
                  fillColor: ColorsValue.textFieldBg,
                  filled: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Enter Area'.tr;
                    }
                    return null;
                  },
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.zipcodeController,
                  isTitle: true,
                  titleStyle: Styles.txtBlackColorW70014,
                  hintStyle: Styles.txtGreyColorW50012,
                  hintText: 'Enter Zip Code'.tr,
                  title: 'Zip Code'.tr,
                  fillColor: ColorsValue.textFieldBg,
                  filled: true,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Enter Zip Code'.tr;
                    }
                    return null;
                  },
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.ownernameController,
                  isTitle: true,
                  titleStyle: Styles.txtBlackColorW70014,
                  hintStyle: Styles.txtGreyColorW50012,
                  hintText: 'Enter Owner Name'.tr,
                  title: 'Owner Name'.tr,
                  fillColor: ColorsValue.textFieldBg,
                  filled: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                Dimens.boxHeight20,
                CustomCountryPickerField(
                  textEditingController: controller.ownermobileController,
                  isTitle: true,
                  text: 'Mobile Number '.tr,
                  hintText: 'Enter Mobile Number '.tr,
                  titleStyle: Styles.txtBlackColorW70014.copyWith(
                    fontSize:
                        Utility.isTablet() ? Dimens.twenty : Dimens.fourteen,
                  ),
                  hintStyle: Styles.txtGreyColorW50012.copyWith(
                    fontSize:
                        Utility.isTablet() ? Dimens.eighteen : Dimens.fourteen,
                  ),
                  fillColor: ColorsValue.textFieldBg,
                  radius: Dimens.ten,
                  initialvalue: PhoneNumber(
                    isoCode: PhoneNumber.getISO2CodeByPrefix(
                      controller.dialOwnerCode,
                    ),
                  ),
                  onInputChanged: (PhoneNumber number) {
                    controller.dialOwnerCode = number.dialCode ?? '';
                    controller.update();
                  },
                  oninitialValidation: (bool value) {
                    controller.isOwnerValid = value;
                    controller.update();
                  },
                  validation: (val) {
                    if (!controller.isOwnerValid) {
                      return "Enter Valid Mobile Number";
                    }
                    return null;
                  },
                  keyboardAction: TextInputAction.next,
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.managernameController,
                  isTitle: true,
                  titleStyle: Styles.txtBlackColorW70014,
                  hintStyle: Styles.txtGreyColorW50012,
                  hintText: 'Enter Manager Name'.tr,
                  title: 'Manager Name'.tr,
                  fillColor: ColorsValue.textFieldBg,
                  filled: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                Dimens.boxHeight20,
                CustomCountryPickerField(
                  textEditingController: controller.managermobileController,
                  isTitle: true,
                  text: 'Mobile Number '.tr,
                  hintText: 'Enter Mobile Number '.tr,
                  titleStyle: Styles.txtBlackColorW70014.copyWith(
                    fontSize:
                        Utility.isTablet() ? Dimens.twenty : Dimens.fourteen,
                  ),
                  hintStyle: Styles.txtGreyColorW50012.copyWith(
                    fontSize:
                        Utility.isTablet() ? Dimens.eighteen : Dimens.fourteen,
                  ),
                  fillColor: ColorsValue.textFieldBg,
                  radius: Dimens.ten,
                  initialvalue: PhoneNumber(
                    isoCode: PhoneNumber.getISO2CodeByPrefix(
                      controller.dialManagerCode,
                    ),
                  ),
                  onInputChanged: (PhoneNumber number) {
                    controller.dialManagerCode = number.dialCode ?? '';
                    controller.update();
                  },
                  oninitialValidation: (bool value) {
                    controller.isManagerValid = value;
                    controller.update();
                  },
                  validation: (val) {
                    if (!controller.isManagerValid) {
                      return "Enter Valid Mobile Number";
                    }
                    return null;
                  },
                  keyboardAction: TextInputAction.done,
                ),
                Dimens.boxHeight20,
                CustomButton(
                  heightBtn: Dimens.fifty,
                  onPressed: () {
                    controller.postCreateCustomer();
                  },
                  text: "Save",
                  textStyle: Styles.whiteColorW70016,
                  backgroundColor: ColorsValue.appColor,
                  radius: Dimens.zero,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
