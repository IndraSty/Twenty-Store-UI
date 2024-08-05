import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:twenty_store/common/utils/kcolors.dart';
import 'package:twenty_store/common/utils/kstrings.dart';
import 'package:twenty_store/common/widgets/app_style.dart';
import 'package:twenty_store/common/widgets/custom_button.dart';
import 'package:twenty_store/common/widgets/reusable_text.dart';
import 'package:twenty_store/const/resource.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Image.asset(R.ASSETS_IMAGES_GETSTARTED_PNG),
            SizedBox(
              height: 30.h,
            ),
            Text(
              AppText.kWelcomeHeader,
              textAlign: TextAlign.center,
              style: appStyle(
                24,
                Kolors.kPrimary,
                FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: ScreenUtil().screenWidth - 100,
              child: Text(
                AppText.kWelcomeMessage,
                style: appStyle(
                  11,
                  Kolors.kGray,
                  FontWeight.normal,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              text: AppText.kGetStarted,
              btnHeight: 35,
              radius: 20,
              btnWidth: ScreenUtil().screenWidth,
              onTap: () {
                // TODO: uncoment the bool storage when the app is ready
                // Storage().setBool("firstOpen", true);
                context.go('/home');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReusableText(
                  text: "Already have an account?",
                  style: appStyle(12, Kolors.kDark, FontWeight.normal),
                ),
                TextButton(
                  onPressed: () {
                    context.go('/login');
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
