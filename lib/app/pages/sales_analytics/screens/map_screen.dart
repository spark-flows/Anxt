import 'package:a_nxt/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalesAnalyticsController>(
      initState: (state) {
        var controller = Get.find<SalesAnalyticsController>();
        controller.mapPosition = null;
        controller.selectedLocation = Get.arguments;
      },
      builder: (controller) {
        return Scaffold(
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: "Location",
            isCenter: true,
          ),
          body: SafeArea(
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: controller.selectedLocation ?? LatLng(21.1702, 72.8311),
                    zoom: 14,
                  ),
                  onTap: (LatLng latLng) {
                    controller.onMapTapped(latLng);
                  },
                  onCameraMove: (position) {
                    controller.selectedLocation = position.target;
                    controller.update();
                  },
                  onMapCreated: (GoogleMapController mapController) {
                    controller.mapSelectController = mapController;
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: true,
                  markers: {
                    if (controller.selectedLocation != null)
                      Marker(
                        markerId: MarkerId("selected"),
                        position: controller.selectedLocation!,
                      ),
                  },
                ),
                if (controller.addressController.text.isNotEmpty)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: Dimens.edgeInsets15,
                      decoration: BoxDecoration(
                        color: ColorsValue.whiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimens.fifteen),
                          topRight: Radius.circular(Dimens.fifteen),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: ColorsValue.greyColor.withOpacity(0.3),
                            blurRadius: 10,
                            offset: Offset(0, -2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on, color: ColorsValue.appColor),
                              SizedBox(width: Dimens.eight),
                              Expanded(
                                child: Text(
                                  controller.addressController.text,
                                  style: Styles.txtBlackColorW50014,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
