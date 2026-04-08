import 'package:a_nxt/app/app.dart';
import 'package:a_nxt/domain/domain.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddOldCustomerScreen extends StatelessWidget {
  const AddOldCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalesAnalyticsController>(
      initState: (state) {
        var controller = Get.find<SalesAnalyticsController>();
        controller.postCustomerList();
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: 'Add Old Customer'.tr,
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Customer", style: Styles.txtBlackColorW70014),
                ),
                Dimens.boxHeight5,

                DropdownSearch<CustomerListData>.multiSelection(
                  items: (filter, _) => controller.customerList,
                  itemAsString: (item) => "${item.name}",
                  selectedItems:
                      controller.customerList
                          .where((e) => e.checkbox ?? false)
                          .toList(),
                  decoratorProps: DropDownDecoratorProps(
                    decoration: InputDecoration(
                      hintText: "Select Reminder & Invoice Email",
                      hintStyle: Styles.txtGreyColorW50012,
                      filled: true,
                      fillColor: ColorsValue.textFieldBg,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Dimens.ten),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Dimens.ten),
                        borderSide: BorderSide.none,
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Dimens.ten),
                        borderSide: BorderSide.none,
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Dimens.twelve),
                        borderSide: BorderSide.none,
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Dimens.ten),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  compareFn: (a, b) => a.id == b.id,
                  popupProps: PopupPropsMultiSelection.modalBottomSheet(
                    showSearchBox: true,
                    title: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "Select Customer",
                        style: Styles.txtBlackColorW70018,
                      ),
                    ),
                    fit: FlexFit.loose,
                    containerBuilder: (context, popupWidget) {
                      return SafeArea(
                        bottom: true, // ✅ FIX
                        child: popupWidget,
                      );
                    },
                    modalBottomSheetProps: ModalBottomSheetProps(
                      backgroundColor: Colors.grey.shade100, // 👈 your color
                      elevation: 10,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                    ),
                    itemBuilder: (
                      BuildContext context,
                      CustomerListData item,
                      bool isSelected,
                      bool isDisabled,
                    ) {
                      return Padding(
                        padding: Dimens.edgeInsets20_00_10_00,
                        child: Text(
                          item.name ?? "",
                          style: Styles.txtBlackColorW50014,
                        ),
                      );
                    },
                    validationBuilder: (context, selectedItems) {
                      return Padding(
                        padding: Dimens.edgeInsets20_10_20_10,
                        child: CustomButton(
                          onPressed: () {
                            for (var item in controller.customerList) {
                              item.checkbox = selectedItems.contains(item);
                            }
                            controller.update();
                            Get.back(); // close bottom sheet
                          },
                          text: "OK",
                          isColor: true,
                          textStyle: Styles.whiteColorW70016,
                          backgroundColor: ColorsValue.appColor,
                        ),
                      );
                    },
                    searchFieldProps: TextFieldProps(
                      padding: Dimens.edgeInsets10_10_10_00,
                      decoration: InputDecoration(
                        contentPadding: Dimens.edgeInsets20_15_20_15,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Dimens.ten),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Dimens.ten),
                          borderSide: BorderSide.none,
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Dimens.ten),
                          borderSide: BorderSide.none,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Dimens.ten),
                          borderSide: BorderSide.none,
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Dimens.ten),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: ColorsValue.whiteColor,
                        prefixIcon: Padding(
                          padding: Dimens.edgeInsets10,
                          child: SvgPicture.asset(AssetConstants.ic_search),
                        ),
                        hintText: 'Search',
                        hintStyle: Styles.txtGreyColorW50012.copyWith(
                          fontSize: Dimens.fourteen,
                        ),
                        errorStyle: Styles.redColorW50014.copyWith(
                          fontSize: Dimens.twelve,
                        ),
                      ),
                    ),
                  ),
                  onChanged: (List<CustomerListData> selectedList) {
                    for (var item in controller.customerList) {
                      item.checkbox = selectedList.contains(item);
                    }
                    controller.update();
                  },
                ),
                Dimens.boxHeight20,
                CustomButton(
                  heightBtn: Dimens.fifty,
                  onPressed: () {
                    controller.postCustomerAsssign();
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
