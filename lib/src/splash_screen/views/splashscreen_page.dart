import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:twenty_store/common/services/storage.dart';
import 'package:twenty_store/const/resource.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    _navigator();
    super.initState();
  }

  _navigator() async {
    await Future.delayed(
      const Duration(microseconds: 3000),
      () {
        if (Storage().getBool('firstOpen') == null) {
          GoRouter.of(context).go('/onboarding');
        } else {
          GoRouter.of(context).go('/home');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              R.ASSETS_IMAGES_SPLASHSCREEN_PNG,
            ),
          ),
        ),
      ),
    );
  }
}
