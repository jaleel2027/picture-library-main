// ignore_for_file: unnecessary_null_comparison, must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picture_library/utils/asset_image_utils.dart';
import 'package:picture_library/utils/color_utilities.dart';
import 'package:picture_library/utils/font_style_utilities.dart';
import 'package:picture_library/utils/route_utilities.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      Get.offAndToNamed(RouteUtilities.dashboard);
      timer.cancel();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage("assets/images/png/logo.png"), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: ColorUtilities.blueColor.withOpacity(0.2),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
              color: ColorUtilities.blueColor,
              height: double.infinity,
              width: double.infinity,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                            filterQuality: FilterQuality.low,
                            image: AssetImage(ImageUtils.logo),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Picture Gallery",
                      textAlign: TextAlign.center,
                      style: FontStyleUtilities.h20(
                          fontWeight: FWT.bold,
                          fontColor: ColorUtilities.whiteColor),
                    )
                  ],
                ),
              ),
            )));
  }
}
