import 'package:a_nxt/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () {
                    RouteManagement.goToProfileScreen();
                  },
                  child: Image.asset(
                    AssetConstants.usera,
                    height: Utility.isTablet() ? Dimens.sixty : Dimens.fourty,
                  ),
                ),
              ),
            ],
          ),
          body: GridView.builder(
            padding: Dimens.edgeInsets20_30_20_50,
            itemCount: controller.homeList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: Dimens.twenty,
              crossAxisSpacing: Dimens.twenty,
            ),
            itemBuilder: (context, index) {
              var item = controller.homeList[index];
              return GestureDetector(
                onTap: () {
                  controller.selectItem = item.name ?? "";
                  controller.update();
                  controller.onTapItem(controller.selectItem);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.fourteen),
                    color:
                        controller.selectItem == item.name
                            ? ColorsValue.appColor
                            : ColorsValue.lightAppColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        controller.selectItem == item.name
                            ? item.activeIcon ?? ""
                            : item.icon ?? "",
                      ),
                      Dimens.boxHeight10,
                      Text(
                        item.name ?? "",
                        style:
                            controller.selectItem == item.name
                                ? Styles.whiteColorW70016
                                : Styles.appColorW50016,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
