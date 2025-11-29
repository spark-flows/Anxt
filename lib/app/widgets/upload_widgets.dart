import 'package:a_nxt/app/app.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UploadWidgets extends StatelessWidget {
  final String txt;
  final String? svgPicture;
  Color bgColor;
  double height;
  String? image;
  GestureTapCallback onTap;
  UploadWidgets({
    Key? key,
    required this.txt,
    required this.height,
    required this.onTap,
    required this.bgColor,
    this.svgPicture,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(Dimens.five),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.five),
        child: InkWell(
          onTap: onTap,
          child: DottedBorder(
            options: RectDottedBorderOptions(
              color: ColorsValue.txtGreyColor,
              strokeWidth: Dimens.two,
              dashPattern: [Dimens.five],
            ),
            child:
                (image?.isNotEmpty ?? false) || image != null
                    ? CachedNetworkImage(
                      imageUrl: image ?? "",
                      height: height,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                      placeholder: (context, url) {
                        return Image.asset(
                          AssetConstants.placeholder,
                          height: height,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Image.asset(
                          AssetConstants.placeholder,
                          height: height,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                        );
                      },
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          svgPicture ?? "",
                          height: Dimens.twenty,
                          colorFilter: ColorFilter.mode(
                            ColorsValue.txtGreyColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        Dimens.boxWidth10,
                        Center(
                          child: Text(txt, style: Styles.txtGreyColorW60014),
                        ),
                      ],
                    ),
          ),
        ),
      ),
    );
  }
}
