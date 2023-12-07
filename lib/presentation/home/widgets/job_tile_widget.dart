import 'package:employee/data/models/job_model.dart';

import 'package:employee/utils/meta_assets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

import 'package:employee/utils/meta_colors.dart';

// ignore: must_be_immutable
class JobTile extends StatelessWidget {
  JobTile({
    super.key,
    required this.data,
    this.onTap,
  });
  JobModel data;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Get.theme.primaryColor.withOpacity(0.1),
                      offset: const Offset(0, 10),
                      blurRadius: 20)
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          data.companyName,
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w600,
                              color: Get.theme.primaryColor),
                        ),
                      ),
                      Text(
                        DateFormat('dd MMM ,yyy').format(data.postedAt),
                        style: const TextStyle(
                            fontSize: 14, color: MetaColors.secondaryTextColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    data.jobTitle,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Get.theme.colorScheme.secondary),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            MetaAssets.cashBagIcon,
                            height: 16,
                            colorFilter: const ColorFilter.mode(
                                MetaColors.secondaryTextColor, BlendMode.srcIn),
                          ),
                          Text(
                            " ${data.salaryRange} ",
                            style: const TextStyle(
                                fontSize: 16,
                                color: MetaColors.secondaryTextColor),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          data.location,
                          style: const TextStyle(
                              fontSize: 16,
                              color: MetaColors.secondaryTextColor),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
