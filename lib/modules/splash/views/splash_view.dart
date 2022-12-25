import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/Images/custom_asset_image.dart';
import '../../../core/constants/image_constants.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashController controller = Get.find();

  @override
  void initState() {
    controller.setSplashTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomAssetImageView(
              fit: BoxFit.fill,
              imagePath: APP_ICON,
              height: 200.h,
              width: 200.h,
            ),
          ],
        ),
      ),
    );
  }
}
