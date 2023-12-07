// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:employee/data/models/job_model.dart';
import 'package:employee/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:employee/presentation/home/controller.dart';
import 'package:employee/utils/meta_colors.dart';

import '../../data/controllers/auth_controller.dart';

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
                  selectedItemColor: MetaColors.primaryColor,
                  unselectedItemColor: MetaColors.secondaryTextColor,
                  onTap: (index) {
                    controller.selectedBottomIndex.value = index;
                  },
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.list_alt_outlined),
                        label: 'Jobs Listings'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.edit), label: 'Applied Jobs'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: 'Profile')
                  ]),
              backgroundColor: Colors.white,
              body: controller.selectedBottomIndex.value == 2
                  ? Scaffold(
                      appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        title: Row(
                          children: [
                            Text(
                              "Your Profile",
                              style: GoogleFonts.autourOne(
                                  color: MetaColors.textColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Icon(
                              Icons.person,
                              color: MetaColors.textColor,
                            )
                          ],
                        ),
                      ),
                      body: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Center(
                                child: SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: Stack(
                                    children: [
                                      CircleAvatar(
                                          radius: 60,
                                          backgroundImage: AuthController
                                                      .to
                                                      .userModel
                                                      .value
                                                      ?.profilePic !=
                                                  null
                                              ? FileImage(File(AuthController
                                                      .to
                                                      .userModel
                                                      .value
                                                      ?.profilePic ??
                                                  ''))
                                              : null),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: CircleAvatar(
                                          radius: 17,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            backgroundColor:
                                                MetaColors.textColor,
                                            radius: 15,
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text("Contact Info",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: MetaColors.textColor)),
                                  ),
                                  Icon(Icons.edit, color: MetaColors.textColor)
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Full Name',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: MetaColors.secondaryTextColor),
                                    ),
                                    Text(
                                      '${AuthController.to.userModel.value?.name ?? ''}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                          color: MetaColors.textColor),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Email',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: MetaColors.secondaryTextColor),
                                    ),
                                    Text(
                                      '${AuthController.to.userModel.value?.email ?? ''}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                          color: MetaColors.textColor),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Mobile Number',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: MetaColors.secondaryTextColor),
                                    ),
                                    Text(
                                      '${AuthController.to.userModel.value?.phoneNumber ?? ''}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                          color: MetaColors.textColor),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                  color: MetaColors.textColor.withOpacity(0.7)),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text("Employment Information",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: MetaColors.textColor)),
                                  ),
                                  Icon(Icons.edit, color: MetaColors.textColor)
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Resume',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: MetaColors.secondaryTextColor),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.doc_fill,
                                          color: MetaColors.textColor,
                                          size: 40,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${"Hey"}",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color:
                                                          MetaColors.textColor,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  DateFormat('dd/mm/yy').format(
                                                    DateTime.now(),
                                                  ),
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: MetaColors.textColor,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Cover Letter',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: MetaColors.secondaryTextColor),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.doc_fill,
                                          color: MetaColors.textColor,
                                          size: 40,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${"j"}",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color:
                                                          MetaColors.textColor,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  DateFormat('dd/mm/yy').format(
                                                    DateTime.now(),
                                                  ),
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: MetaColors.textColor,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomButton(
                                title: "Log out",
                                onTap: () {
                                  AuthController.to.logout();
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : controller.selectedBottomIndex.value == 1
                      ? Scaffold(
                          appBar: AppBar(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            title: Row(
                              children: [
                                Text(
                                  "Your Applied Jobs",
                                  style: GoogleFonts.autourOne(
                                      color: MetaColors.textColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Icon(
                                  Icons.edit,
                                  color: MetaColors.textColor,
                                )
                              ],
                            ),
                          ),
                          body: Padding(
                            padding:
                                const EdgeInsets.all(16.0).copyWith(top: 0),
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
                                        text: controller.appliedJobs.length
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                            color:
                                                MetaColors.secondaryTextColor,
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
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 0),
                                        itemCount:
                                            controller.appliedJobs.length,
                                        itemBuilder: (context, index) {
                                          return JobTile(
                                              onTap: () {},
                                              data: controller
                                                  .appliedJobs[index].job);
                                        }))
                              ],
                            ),
                          ),
                        )
                      : DefaultTabController(
                          length: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: NestedScrollView(
                                headerSliverBuilder: (context, header) {
                                  return [
                                    SliverAppBar(
                                        snap: true,
                                        floating: true,
                                        collapsedHeight:
                                            200 + kToolbarHeight + 20,
                                        expandedHeight:
                                            200 + kToolbarHeight + 20,
                                        backgroundColor:
                                            MetaColors.primaryColor,
                                        flexibleSpace: FlexibleSpaceBar(
                                          expandedTitleScale: 1,
                                          titlePadding: EdgeInsets.zero,
                                          title: Container(
                                            color: MetaColors.primaryColor,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: kToolbarHeight),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Hi ${AuthController.to.userModel.value?.name ?? ''} 👋🏻",
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        18),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            "Find The Best Job Here!",
                                                            style: GoogleFonts
                                                                .autourOne(
                                                                    fontSize:
                                                                        25),
                                                          ),
                                                          const SizedBox(
                                                            height: 20,
                                                          ),
                                                          TextFormField(
                                                            cursorColor:
                                                                MetaColors
                                                                    .textColor,
                                                            decoration:
                                                                InputDecoration(
                                                                    contentPadding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            16,
                                                                        vertical:
                                                                            12),
                                                                    filled:
                                                                        true,
                                                                    prefixIconColor:
                                                                        MetaColors
                                                                            .textColor,
                                                                    prefixIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .search,
                                                                      size: 30,
                                                                      color: MetaColors
                                                                          .textColor
                                                                          .withOpacity(
                                                                              0.5),
                                                                    ),
                                                                    fillColor: Colors
                                                                        .white10,
                                                                    hintText:
                                                                        "Start searching for jobs",
                                                                    hintStyle: GoogleFonts.poppins(
                                                                        fontSize:
                                                                            18,
                                                                        color: MetaColors
                                                                            .textColor
                                                                            .withOpacity(
                                                                                0.5)),
                                                                    border: OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide
                                                                                .none,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12))),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      color: Colors.white,
                                                      child: TabBar(
                                                          labelColor: MetaColors
                                                              .primaryColor,
                                                          unselectedLabelColor:
                                                              MetaColors
                                                                  .secondaryTextColor,
                                                          indicatorSize:
                                                              TabBarIndicatorSize
                                                                  .label,
                                                          indicatorWeight: 3,
                                                          indicatorColor: MetaColors
                                                              .primaryColor
                                                              .withOpacity(0.9),
                                                          labelStyle: GoogleFonts.poppins(
                                                              fontSize: 18,
                                                              color: MetaColors
                                                                  .primaryColor,
                                                              fontWeight: FontWeight
                                                                  .w500),
                                                          unselectedLabelStyle:
                                                              GoogleFonts.poppins(
                                                                  fontSize: 18,
                                                                  color: MetaColors
                                                                      .secondaryTextColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                          tabs: [
                                                            const Tab(
                                                                text:
                                                                    "Recent Jobs"),
                                                            const Tab(
                                                                text:
                                                                    "Near you"),
                                                          ]),
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ))
                                  ];
                                },
                                body: Container(
                                  child: TabBarView(children: [
                                    ListView.builder(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 8),
                                        itemCount: controller.recentJobs.length,
                                        itemBuilder: (context, index) {
                                          return JobTile(
                                              onTap: () {
                                                controller.showJobDetails(
                                                    controller
                                                        .recentJobs[index]);
                                              },
                                              data:
                                                  controller.recentJobs[index]);
                                        }),
                                    ListView.builder(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 8),
                                        itemCount: controller.nearbyJobs.length,
                                        itemBuilder: (context, index) {
                                          return JobTile(
                                              onTap: () {
                                                controller.showJobDetails(
                                                    controller
                                                        .recentJobs[index]);
                                              },
                                              data:
                                                  controller.nearbyJobs[index]);
                                        })
                                  ]),
                                )),
                          ),
                        )),
        ));
  }
}

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
                      color: MetaColors.primaryColor.withOpacity(0.1),
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
                          style: const TextStyle(
                              fontSize: 14,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w600,
                              color: MetaColors.primaryColor),
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
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: MetaColors.textColor),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(CupertinoIcons.money_dollar_circle),
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
