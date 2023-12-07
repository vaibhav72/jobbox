import 'package:employee/utils/meta_assets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:employee/presentation/home/controller.dart';
import 'package:employee/utils/meta_colors.dart';

import 'widgets/my_jobs_widget.dart';
import 'widgets/profile_widget.dart';
import 'widgets/welcome_view_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Obx(
          () => Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                  currentIndex: controller.selectedBottomIndex.value!,
                  selectedItemColor: Get.theme.primaryColor,
                  unselectedItemColor: MetaColors.secondaryTextColor,
                  selectedLabelStyle: const TextStyle(fontSize: 13),
                  onTap: (index) {
                    controller.selectedBottomIndex.value = index;
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: SvgPicture.asset(
                            MetaAssets.listIcon,
                            height: 18,
                            colorFilter: const ColorFilter.mode(
                                MetaColors.secondaryTextColor, BlendMode.srcIn),
                          ),
                        ),
                        activeIcon: Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: SvgPicture.asset(
                            MetaAssets.listIcon,
                            height: 20,
                            colorFilter: ColorFilter.mode(
                                Get.theme.primaryColor, BlendMode.srcIn),
                          ),
                        ),
                        label: 'Jobs Listings'),
                    BottomNavigationBarItem(
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: SvgPicture.asset(
                            MetaAssets.pencilIcon,
                            height: 18,
                            colorFilter: const ColorFilter.mode(
                                MetaColors.secondaryTextColor, BlendMode.srcIn),
                          ),
                        ),
                        activeIcon: Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: SvgPicture.asset(
                            MetaAssets.pencilIcon,
                            height: 20,
                            colorFilter: ColorFilter.mode(
                                Get.theme.primaryColor, BlendMode.srcIn),
                          ),
                        ),
                        label: 'Applied Jobs'),
                    BottomNavigationBarItem(
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: SvgPicture.asset(
                            MetaAssets.personIcon,
                            height: 18,
                            colorFilter: const ColorFilter.mode(
                                MetaColors.secondaryTextColor, BlendMode.srcIn),
                          ),
                        ),
                        activeIcon: Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: SvgPicture.asset(
                            MetaAssets.personIcon,
                            height: 20,
                            colorFilter: ColorFilter.mode(
                                Get.theme.primaryColor, BlendMode.srcIn),
                          ),
                        ),
                        label: 'Profile')
                  ]),
              backgroundColor: Colors.white,
              body: controller.selectedBottomIndex.value == 2
                  ? const ProfileWidget()
                  : controller.selectedBottomIndex.value == 1
                      ? const MyJobs()
                      : const WelcomeView()),
        ));
  }
}
