import 'package:employee/utils/meta_assets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:employee/presentation/home/controller.dart';
import 'package:employee/utils/meta_colors.dart';

import 'job_tile_widget.dart';

class MyJobs extends GetView<HomeController> {
  const MyJobs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Text(
              "Your Applied Jobs",
              style: GoogleFonts.autourOne(
                  color: Get.theme.colorScheme.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                MetaAssets.pencilIcon,
                height: 20,
                colorFilter: ColorFilter.mode(
                    Get.theme.colorScheme.secondary, BlendMode.srcIn),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0).copyWith(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    text: "You applied for ",
                    style: GoogleFonts.poppins(
                      color: MetaColors.secondaryTextColor,
                      fontSize: 16,
                    ),
                    children: [
                  TextSpan(
                    text: controller.appliedJobs.length.toString(),
                    style: GoogleFonts.poppins(
                        color: MetaColors.secondaryTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: " jobs",
                    style: GoogleFonts.poppins(
                      color: MetaColors.secondaryTextColor,
                      fontSize: 16,
                    ),
                  ),
                ])),
            Expanded(
                child: ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                    itemCount: controller.appliedJobs.length,
                    itemBuilder: (context, index) {
                      return JobTile(
                          onTap: () {},
                          data: controller.appliedJobs[index].job);
                    }))
          ],
        ),
      ),
    );
  }
}
