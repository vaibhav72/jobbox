import 'package:employee/data/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:employee/presentation/home/controller.dart';
import 'package:employee/utils/meta_colors.dart';

import 'job_tile_widget.dart';

class WelcomeView extends GetView<HomeController> {
  const WelcomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: NestedScrollView(
            headerSliverBuilder: (context, header) {
              return [
                SliverAppBar(
                    snap: true,
                    floating: true,
                    collapsedHeight: 200 + kTextTabBarHeight,
                    expandedHeight: 200 + kTextTabBarHeight,
                    backgroundColor: Get.theme.primaryColor,
                    flexibleSpace: FlexibleSpaceBar(
                      expandedTitleScale: 1,
                      titlePadding: EdgeInsets.zero,
                      title: Container(
                        color: Get.theme.primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.only(top: kToolbarHeight),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hi ${AuthController.to.userModel.value?.name ?? ''} 👋🏻",
                                        style:
                                            GoogleFonts.poppins(fontSize: 18),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Find The Best Job Here!",
                                        style:
                                            GoogleFonts.autourOne(fontSize: 25),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        cursorColor:
                                            Get.theme.colorScheme.secondary,
                                        decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                    vertical: 12),
                                            filled: true,
                                            prefixIconColor:
                                                Get.theme.colorScheme.secondary,
                                            prefixIcon: Icon(
                                              Icons.search,
                                              size: 30,
                                              color: Get
                                                  .theme.colorScheme.secondary
                                                  .withOpacity(0.5),
                                            ),
                                            fillColor: Colors.white10,
                                            hintText:
                                                "Start searching for jobs",
                                            hintStyle: GoogleFonts.poppins(
                                                fontSize: 18,
                                                color: Get
                                                    .theme.colorScheme.secondary
                                                    .withOpacity(0.5)),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(12))),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: TabBar(
                                      labelColor: Get.theme.primaryColor,
                                      unselectedLabelColor:
                                          MetaColors.secondaryTextColor,
                                      indicatorSize: TabBarIndicatorSize.label,
                                      indicatorWeight: 3,
                                      indicatorColor: Get.theme.primaryColor
                                          .withOpacity(0.9),
                                      labelStyle: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: Get.theme.primaryColor,
                                          fontWeight: FontWeight.w500),
                                      unselectedLabelStyle: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: MetaColors.secondaryTextColor,
                                          fontWeight: FontWeight.w500),
                                      tabs: const [
                                        Tab(text: "Recent Jobs"),
                                        Tab(text: "Near you"),
                                      ]),
                                ),
                              ]),
                        ),
                      ),
                    ))
              ];
            },
            body: TabBarView(children: [
              ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  itemCount: controller.recentJobs.length,
                  itemBuilder: (context, index) {
                    return JobTile(
                        onTap: () {
                          controller
                              .showJobDetails(controller.recentJobs[index]);
                        },
                        data: controller.recentJobs[index]);
                  }),
              ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  itemCount: controller.nearbyJobs.length,
                  itemBuilder: (context, index) {
                    return JobTile(
                        onTap: () {
                          controller
                              .showJobDetails(controller.recentJobs[index]);
                        },
                        data: controller.nearbyJobs[index]);
                  })
            ])),
      ),
    );
  }
}
