import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:sizer/sizer.dart';
import 'package:swag_app_flutter/app/custom/custom_digital_tailor_view.dart';
import 'package:swag_app_flutter/app/custom/custom_event_view.dart';
import 'package:swag_app_flutter/app/custom/custom_polls.dart';
import 'package:swag_app_flutter/app/custom/custom_product_view.dart';
import 'package:swag_app_flutter/app/custom/custom_single_product_view.dart';
import 'package:swag_app_flutter/app/custom/custom_text_form_field.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/views/brands_screen/brands_view.dart';
import 'package:swag_app_flutter/app/views/daily_polls_screen/daily_polls_view.dart';
import 'package:swag_app_flutter/app/views/swag_centre_screen/swag_centre_controller.dart';
import 'package:swag_app_flutter/app/views/user_profile_screen/user_profiel_view.dart';
import '../../services/theme_provider.dart';
import '../digital_tailors_screen/digital_tailor_view.dart';
import '../events_screen/events_view.dart';
import '../trends_screen/trends_view.dart';
import '../you_follow_screen/you_follow_view.dart';

class SwagCentreView extends StatefulWidget {
  const SwagCentreView({super.key});

  @override
  State<SwagCentreView> createState() => _SwagCentreViewState();
}

class _SwagCentreViewState extends State<SwagCentreView> {
  final SwagCentreController controller = Get.put(SwagCentreController());
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          !themeProvider.isDark ? Colorz.lightViolet : Colorz.darkViolet,
      appBar: AppBar(
        backgroundColor:
            !themeProvider.isDark ? Colorz.lightViolet : Colorz.darkViolet,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizerUtil.deviceType == DeviceType.mobile
                ? Get.size.height * 0.02
                : Get.size.height * 0.04,
          ),
          child: SvgPicture.asset("assets/icons/swagappbarlogo.svg"),
        ),
        actions: [
          Showcase(
            key: controller.showcaseKey1,
            title: 'Profile',
            description: "Tex1",
            tooltipPosition: TooltipPosition.bottom,
            targetShapeBorder: const CircleBorder(),
            tooltipBackgroundColor: Colors.white,
            child: InkWell(
              onTap: () {
                Get.to(
                    transition: Transition.zoom, () => const UserProfileView());
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizerUtil.deviceType == DeviceType.mobile
                      ? Get.size.height * 0.02
                      : Get.size.height * 0.04,
                ),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/profilepic.png"),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: !themeProvider.isDark
                          ? Colorz.primaryBackground
                          : Colorz.dark,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      extendBody: true,
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Showcase(
                key: controller.showcaseKey2,
                title: 'Search',
                description: "tex2",
                tooltipPosition: TooltipPosition.bottom,
                targetShapeBorder: const CircleBorder(),
                tooltipBackgroundColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizerUtil.deviceType == DeviceType.mobile
                        ? Get.size.height * 0.02
                        : Get.size.height * 0.04,
                    vertical: SizerUtil.deviceType == DeviceType.mobile
                        ? Get.size.height * 0.02
                        : Get.size.height * 0.04,
                  ),
                  child: CustomTextFormField(
                    hintText: "What you want to try?",
                    fillColor: !themeProvider.isDark
                        ? Colorz.primaryBackground.withOpacity(0.4)
                        : Colorz.textFormFieldDark,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SvgPicture.asset(
                        !themeProvider.isDark
                            ? "assets/icons/stars.svg"
                            : "assets/icons/starsdarkmode.svg",
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizerUtil.deviceType == DeviceType.mobile
                      ? Get.size.height * 0.02
                      : Get.size.height * 0.04,
                ),
                child: Text(
                  "Today's Outfit Ideas",
                  style: Get.textTheme.titleLarge!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: !themeProvider.isDark
                          ? Colorz.secondary
                          : Colorz.violetGrey),
                ),
              ),
              // const CustomProductView(
              //   itemCount: 6,
              //   image: "assets/images/prod.png",
              //   isTailor: false,
              // ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 350,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return const CustomSingleProductView(
                      image: "assets/images/prod.png",
                    );
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: !themeProvider.isDark
                      ? Colorz.primaryBackground
                      : Colorz.dark,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: SizerUtil.deviceType == DeviceType.mobile
                            ? Get.size.height * 0.02
                            : Get.size.height * 0.04,
                        right: SizerUtil.deviceType == DeviceType.mobile
                            ? Get.size.height * 0.02
                            : Get.size.height * 0.04,
                        top: SizerUtil.deviceType == DeviceType.mobile
                            ? Get.size.height * 0.025
                            : Get.size.height * 0.045,
                        bottom: SizerUtil.deviceType == DeviceType.mobile
                            ? Get.size.height * 0.02
                            : Get.size.height * 0.02,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Barnds",
                            style: Get.textTheme.titleLarge!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: !themeProvider.isDark
                                  ? Colorz.textPrimary
                                  : Colorz.violetGrey,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const BrandsView());
                            },
                            child: SvgPicture.asset(
                              !themeProvider.isDark
                                  ? "assets/icons/rightarrowlight.svg"
                                  : "assets/icons/rightarrowdark.svg",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizerUtil.deviceType == DeviceType.mobile
                            ? Get.size.height * 0.02
                            : Get.size.height * 0.04,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: !themeProvider.isDark
                                  ? Colors.white
                                  : Colorz.textFormFieldDark,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                    !themeProvider.isDark
                                        ? "assets/icons/brand.png"
                                        : "assets/icons/branddark.png",
                                  ),
                                  fit: BoxFit.cover),
                              border: Border.all(
                                width: 1,
                                color: !themeProvider.isDark
                                    ? Colorz.textPrimary.withOpacity(0.2)
                                    : Colorz.textFormFieldDark,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomProductView(
                      title: "Trends",
                      onTap: () {
                        Get.to(() => const TrendsView());
                      },
                      listView: SizedBox(
                        height: 350,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return const CustomSingleProductView(
                              image: "assets/images/prod.png",
                              userImage: "assets/images/tailorprofile.jpeg",
                              userName: "Adam Liu",
                            );
                          },
                        ),
                      ),
                    ),
                    CustomProductView(
                      title: "You Follow",
                      onTap: () {
                        Get.to(() => const YouFollowView());
                      },
                      listView: SizedBox(
                        height: 350,
                        // child: listView,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return const CustomSingleProductView(
                              image: "assets/images/prod.png",
                              userImage: "assets/images/tailorprofile.jpeg",
                              userName: "Adam Liu",
                            );
                          },
                        ),
                      ),
                    ),
                    CustomEventView(
                      title: "Events",
                      itemCount: 3,
                      onTap: () {
                        Get.to(() => const EventsView());
                      },
                      image: "assets/images/event.png",
                      eventName: "Los Angeles Fashion Week",
                      eventDate: "15 Oct — 17 Oct",
                    ),
                    CustomDigitalTailorView(
                      title: "Digital Tailors",
                      itemCount: 3,
                      onTap: () {
                        Get.to(() => const DigitalTailorsView());
                      },
                      image: "assets/images/digitaltailor.png",
                      tailorProfile: "assets/images/tailorprofile.jpeg",
                      tailorName: "Adam Liu",
                      follower: "249K Followers",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizerUtil.deviceType == DeviceType.mobile
                              ? Get.size.height * 0.02
                              : Get.size.height * 0.04,
                          right: SizerUtil.deviceType == DeviceType.mobile
                              ? Get.size.height * 0.02
                              : Get.size.height * 0.04,
                          top: SizerUtil.deviceType == DeviceType.mobile
                              ? Get.size.height * 0.02
                              : Get.size.height * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Daily Polls",
                            style: Get.textTheme.titleLarge!.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: !themeProvider.isDark
                                    ? Colorz.textPrimary
                                    : Colorz.violetGrey),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const DailyPollsView());
                            },
                            child: SvgPicture.asset(
                              !themeProvider.isDark
                                  ? "assets/icons/rightarrowlight.svg"
                                  : "assets/icons/rightarrowdark.svg",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CustomPolls(
                      title:
                          "What is your favorite decade for fashion inspiration?",
                      creatorName: "Adam Liu",
                      creatorIcon: "assets/images/prod.png",
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
