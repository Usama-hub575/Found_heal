import 'dart:ui' as ui;

import 'package:found_heal/export.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.initAppResources(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
              Assets.images.svg.splashGreenTop,
            ),
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaY: 10, sigmaX: 10),
            child: SizedBox(
              height: sizes.height,
            ),
          ),
          Positioned(
            top: 330,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    Assets.images.svg.logoMain,
                    //assets.logo,
                    width: sizes.widthRatio * 140,
                  ),
                  const Text(
                    "Welcome to",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      fontFamily: "Red Hat Display",
                    ),
                  ),
                  const Text(
                    "Kora App",
                    style: TextStyle(
                      fontSize: 34,
                      color: ColorName.primaryColor,
                      fontWeight: FontWeight.w800,
                      fontFamily: "Red Hat Display",
                    ),
                  ),
                  const Text(
                    "Empowering Freelancers, Private users, Companies and Connecting Opportunities.",
                    style: TextStyle(
                      fontSize: 15,
                      color: ColorName.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Red Hat Display",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
